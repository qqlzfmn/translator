from pathlib import Path
from transformers import pipeline
import gradio as gr

workdir = Path('.').absolute()

def translate(text):

    translator = pipeline(
        model=workdir/'model'/'opus-mt-en-zh',
        task='translation',
    )

    translated = translator(text)[0]['translation_text']

    return translated 

demo = gr.Interface(fn=translate, inputs="text", outputs="text")

if __name__ == "__main__":
    demo.launch(
	    server_name="0.0.0.0",
        server_port=7860,
        share=True,
        ssl_certfile=workdir/"ssl"/"cert.pem",
        ssl_keyfile=workdir/"ssl"/"key.pem",
        ssl_verify=False,
    )
