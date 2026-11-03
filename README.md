# AlloyDB Omni + EmbeddingGemma RAG Demo

A Retrieval-Augmented Generation (RAG) demonstration using AlloyDB Omni, Google's EmbeddingGemma model, vector similarity search, and Qwen 2.5.

## Project Overview

This project demonstrates how a user query can be converted into an embedding, matched against product descriptions stored in AlloyDB Omni, and used to generate a product recommendation.

## Architecture

1. **EmbeddingGemma:** Converts the customer question into a vector embedding.
2. **AlloyDB Omni:** Performs vector similarity search against stored product embeddings.
3. **SQL filtering:** Retrieves relevant products using inventory availability and store information.
4. **Qwen 2.5 (0.5B):** Generates a response using the retrieved product information through Ollama running locally in Google Cloud Shell.

## Example Query

What kind of fruit trees grow well here?

### Retrieved Product

| Field | Result |
|---|---|
| Product | Cherry Tree |
| Price | $75.00 |
| Store ZIP | 93230 |
| USDA Zones | 4–9 |
| Climate | Cool and moist |
| Soil | Sandy soil |

### Generated Response

> Delicious cherries, perfect for a cherry tree in the USDA zones 4-9.

## Technologies Used

- Google Kubernetes Engine (GKE)
- AlloyDB Omni
- PostgreSQL
- google_ml_integration
- EmbeddingGemma
- Qwen 2.5 (0.5B)
- Ollama
- SQL
- Google Cloud Shell

## Repository Structure

```text
alloydb-embeddinggemma-rag-demo/
├── README.md
├── qwen-response.txt
├── sql/
│   └── vector-search.sql
└── demo/

```
## Important Implementation Note

The AlloyDB vector retrieval and Qwen response generation run as separate stages.

Qwen 2.5 runs locally through Ollama in Cloud Shell. It is not registered as an AlloyDB model and does not run inside the GKE cluster.

The Codelab's Gemma 12B GPU inference stage could not be completed because GKE was unable to provision the required NVIDIA L4 GPU.

## Project Status

- [x] EmbeddingGemma deployment and API test
- [x] EmbeddingGemma model registration in AlloyDB
- [x] Vector similarity search
- [x] Product and inventory filtering
- [x] Qwen 2.5 response generation
- [x] RAG demonstration output documented
- [ ] Gemma 12B GPU inference

## Disclaimer

This is a demonstration using sample product and inventory data. It is not connected to a live retail inventory system.
