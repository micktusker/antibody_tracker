-- Schema for SQLite database "antibody_tracker.db"
CREATE TABLE antibody_information(
  project TEXT,
  external_id_vh_vl TEXT,
  tusk_id TEXT PRIMARY KEY,
  description TEXT,
  vh_sequence TEXT,
  vl_sequence TEXT);

CREATE TABLE antibody_information_docs(
  antibody_information_docs_id INTEGER PRIMARY KEY,
  tusk_id TEXT REFERENCES antibody_information(tusk_id),
  document BLOB);

CREATE TABLE inventory_information(
  inventory_information_id INTEGER PRIMARY KEY,
  batch_number TEXT,
  concentration_mg_per_ml REAL,
  buffer TEXT,
  eu_per_mg REAL,
  aliquot_size_ml REAL,
  provider TEXT,
  total_amount_of_batch_still_available REAL,
  original_vial_number INTEGER,
  number_of_vials_left INTEGER,
  storage_temp INTEGER,
  box_location INTEGER,
  vial_location TEXT,
  date_of_entry DATETIME DEFAULT CURRENT_TIMESTAMP,
  duration_of_storage INTEGER,
  reservations INTEGER,
  notes TEXT,
  tusk_id TEXT REFERENCES antibody_information(tusk_id));

CREATE TABLE inventory_information_docs(
  inventory_information_docs_id INTEGER PRIMARY KEY,
  production_report BLOB,
  antibody_batch_data_sheet BLOB,
  inventory_information_id INTEGER REFERENCES inventory_information(inventory_information_id));
