-- schema.sql

-- Create the clients table
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL
);

-- Create the projects table
CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    description TEXT,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Create the members table
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    member_name VARCHAR(255) NOT NULL
);

-- Create the technologies table
CREATE TABLE technologies (
    technology_id SERIAL PRIMARY KEY,
    technology_name VARCHAR(255) NOT NULL
);

-- Create the project_members table
CREATE TABLE project_members (
    project_id INT,
    member_id INT,
    role VARCHAR(255),
    PRIMARY KEY (project_id, member_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE
);

-- Create the project_technologies table
CREATE TABLE project_technologies (
    project_id INT,
    technology_id INT,
    PRIMARY KEY (project_id, technology_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (technology_id) REFERENCES technologies(technology_id) ON DELETE CASCADE
);

