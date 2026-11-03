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

## Codelab Step 9 – Execution Status

### Completed
- Retrieved the AlloyDB Omni endpoint: `10.160.0.8`.
- Connected to the `demo` database using `psql` from the AlloyDB pod.
- Verified model registration using `google_ml.model_info_view`.
- Confirmed that `embeddinggemma` is registered and available.
- Completed vector similarity search using EmbeddingGemma.
- Retrieved the top matching in-stock product for store 1583.
- Generated a separate response using Qwen 2.5 0.5B through Ollama in Cloud Shell.

### Not Completed
- Gemma 12B GPU model registration in AlloyDB.
- Gemma 12B inference using `google_ml.predict_row`.
- Complete in-database RAG generation using Gemma 12B.

### Reason for Incomplete GPU Steps
The Gemma 12B deployment could not be scheduled because GKE was unable to provision the required NVIDIA L4 GPU. Therefore, the original in-database Gemma 12B workflow could not be completed.

### Implementation Note
This project demonstrates vector retrieval in AlloyDB Omni and separate LLM response generation using Qwen 2.5 in Cloud Shell. It is an adapted RAG demonstration, not the fully self-contained in-database RAG workflow from the original codelab.
