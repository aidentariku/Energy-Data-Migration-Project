-- Step 1: Create the Source Table
CREATE TABLE energy_generation (
    id SERIAL PRIMARY KEY,
    plant_name VARCHAR(100),
    generation_type VARCHAR(50),
    generation_amount NUMERIC(10, 2),
    generation_date DATE
);

-- Step 2: Insert Sample Data into the Source Table
INSERT INTO energy_generation (plant_name, generation_type, generation_amount, generation_date) VALUES
('Wind Farm A', 'Wind', 1500.00, '2023-10-01'),
('Solar Plant B', 'Solar', 1200.00, '2023-10-01'),
('Natural Gas Plant C', 'Natural Gas', 3000.00, '2023-10-02'),
('Wind Farm D', 'Wind', 1800.00, '2023-10-02');

-- Step 3: Create the Destination Table
CREATE TABLE archived_generation (
    record_id SERIAL PRIMARY KEY,
    plant_name VARCHAR(100),
    generation_type VARCHAR(50),
    total_generated NUMERIC(10, 2),
    generation_date DATE
);

-- Step 4: Migrate Data
INSERT INTO archived_generation (plant_name, generation_type, total_generated, generation_date)
SELECT 
    plant_name,
    generation_type,
    generation_amount AS total_generated,
    generation_date
FROM energy_generation;

-- Step 5: Verify the Migration
SELECT * FROM archived_generation;
