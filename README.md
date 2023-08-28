# Translator

## Install
1. Generate your own personal access token like [this answer](https://stackoverflow.com/a/70320541/10338137)
2. Install git-lfs
    1. on macos: `brew install git-lfs`
    2. on ubuntu: `apt install git-lfs`
3. Initialize git lfs with this command `git lfs install`
4. Clone Repo with this command `git clone --recurse-submodules https://github.com/qqlzfmn/translator.git & cd translator`
5. Replace self-signed certificate with your own one or a new one
    1. Replace with thi command `cp path/to/the/key.pem ./ssl/key.pem & cp path/to/the/cert.pem ./ssl/cert.pem`
    2. Generate self-signed certificate with this command `openssl req -x509 -newkey rsa:4096 -keyout ssl/key.pem -out ssl/cert.pem -sha256 -days 365 -nodes`
6. Deploy with this command `docker compose -f docker-compose.yml up -d`
7. Access link: [https://localhost:7860](https://localhost:7860)