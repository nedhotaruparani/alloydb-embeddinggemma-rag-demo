-- AlloyDB Omni + EmbeddingGemma
-- Retrieve the five closest products to the customer's question.

SELECT
    cp.product_name,
    cp.product_description,
    cp.sale_price,
    ce.embedding <=> embedding(
        'embeddinggemma',
        'What kind of fruit trees grow well here?'
    )::vector AS distance
FROM cymbal_products cp
JOIN cymbal_embedding ce
    ON ce.uniq_id = cp.uniq_id
ORDER BY distance
LIMIT 5;

-- Filtered RAG retrieval for store ID 1583.

WITH trees AS (
    SELECT
        cp.product_name,
        cp.product_description AS description,
        cp.sale_price,
        cs.zip_code,
        cp.uniq_id AS product_id
    FROM cymbal_products cp
    JOIN cymbal_embedding ce
        ON ce.uniq_id = cp.uniq_id
    JOIN cymbal_inventory ci
        ON ci.uniq_id = cp.uniq_id
    JOIN cymbal_stores cs
        ON cs.store_id = ci.store_id
    WHERE ci.inventory > 0
      AND cs.store_id = 1583
    ORDER BY ce.embedding <=> embedding(
        'embeddinggemma',
        'What kind of fruit trees grow well here?'
    )::vector
    LIMIT 1
)
SELECT * FROM trees;
