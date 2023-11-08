terraform {
  backend "s3" {
    bucket = "<NOME_DO_BUCKET>"
    key = "<PASTA>/state.tfstate"
    region = "us-east-1" #Região do Bucket
  }
}
