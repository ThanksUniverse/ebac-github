-- Criar Tabela
CREATE TABLE TestIndexing(id serial, name Text);

-- Inserir Valores
INSERT INTO TestIndexing(name) SELECT 'bob' FROM GENERATE_SERIES(1, 9999999);

-- Select sem Indice
EXPLAIN ANALYZE SELECT * FROM TESTINDEXING WHERE ID = 100000 -- Antes

-- Criar Indice
CREATE INDEX TestIndexing_idx_ebac ON TestIndexing(id)

-- Select com indice
EXPLAIN ANALYZE SELECT * FROM TESTINDEXING WHERE ID = 100000 -- Antes
