class BaseLLM():
    def __init__(self):
        raise NotImplementedError()

    def inference(self, query: str) -> str:
        raise NotImplementedError()