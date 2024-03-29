import torch
from transformers import AutoTokenizer, AutoModelForCausalLM, pipeline

def generate_prompt(question, prompt_file="prompt.md", metadata_file="metadata.sql"):
    with open(prompt_file, "r") as f:
        prompt = f.read()
    
    with open(metadata_file, "r") as f:
        table_metadata_string = f.read()

    prompt = prompt.format(
        user_question=question, table_metadata_string=table_metadata_string
    )
    return prompt


def get_tokenizer_model(model_name):
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForCausalLM.from_pretrained(
        model_name,
        trust_remote_code=True,
        torch_dtype=torch.float16,
        device_map="auto",
        use_cache=True,
    )
    return tokenizer, model

def run_inference(question, prompt_file="prompt.md", metadata_file="metadata.sql"):
    tokenizer, model = get_tokenizer_model("defog/sqlcoder")
    prompt = generate_prompt(question, prompt_file, metadata_file)
    
    # make sure the model stops generating at triple ticks
    eos_token_id = tokenizer.convert_tokens_to_ids(["```"])[0]
    pipe = pipeline(
        "text-generation",
        model=model,
        tokenizer=tokenizer,
        max_new_tokens=300,
        do_sample=False,
        num_beams=5, # do beam search with 5 beams for high quality results
    )
    generated_query = (
        pipe(
            prompt,
            num_return_sequences=1,
            eos_token_id=eos_token_id,
            pad_token_id=eos_token_id,
        )[0]["generated_text"]
        .split("```sql")[-1]
        .split("```")[0]
        .split(";")[0]
        .strip()
        + ";"
    )
    return generated_query

if __name__ == "__main__":
    while(True):
        question = input("What would you like to ask? ")
        print("Loading a model and generating a SQL query for answering your question...")
        print(run_inference(question))
