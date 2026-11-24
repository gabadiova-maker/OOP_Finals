
-- CampusConnect Final Project
-- Database Schema
-- Java Swing + JDBC + MySQL/MariaDB

CREATE DATABASE IF NOT EXISTS campusconnect_db
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE campusconnect_db;

-- =====================================
-- Table 1: Student Service Requests
-- =====================================

CREATE TABLE service_request (
    ticket_id VARCHAR(20) NOT NULL,
    student_id VARCHAR(30) NOT NULL,
    student_name VARCHAR(100) NOT NULL,

    category ENUM(
        'ENROLLMENT',
        'DOCUMENT',
        'PAYMENT',
        'ADVISING'
    ) NOT NULL,

    priority INT NOT NULL,

    concern VARCHAR(255) NOT NULL,

    estimated_days INT NOT NULL,

    status ENUM(
        'PENDING',
        'IN_PROGRESS',
        'COMPLETED',
        'CANCELLED'
    ) NOT NULL DEFAULT 'PENDING',

    created_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (ticket_id),

    CONSTRAINT chk_priority
        CHECK (priority BETWEEN 1 AND 5),

    CONSTRAINT chk_estimated_days
        CHECK (estimated_days >= 1)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- =====================================
-- Table 2: Ticket Number Sequence
-- =====================================

CREATE TABLE ticket_sequence (
    id INT NOT NULL,
    next_ticket INT NOT NULL,

    PRIMARY KEY (id),

    CONSTRAINT chk_next_ticket
        CHECK (next_ticket >= 1001)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- =====================================
-- Initialize Ticket Number
-- =====================================

INSERT INTO ticket_sequence (id, next_ticket)
VALUES (1, 1001);

-- =====================================
-- End of Schema
-- =====================================
