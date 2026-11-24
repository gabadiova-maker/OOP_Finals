
-- BookBridge Final Project
-- Database Schema
-- Java Swing + JDBC + MariaDB

CREATE DATABASE IF NOT EXISTS bookbridge_db
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE bookbridge_db;

-- =====================================
-- Table 1: Members
-- =====================================

CREATE TABLE member (
    member_id VARCHAR(30) NOT NULL,
    member_name VARCHAR(100) NOT NULL,
    membership_type ENUM(
        'STUDENT',
        'FACULTY',
        'GUEST'
    ) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (member_id)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- =====================================
-- Table 2: Books
-- =====================================

CREATE TABLE book (
    isbn VARCHAR(30) NOT NULL,
    title VARCHAR(200) NOT NULL,
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (isbn),

    CONSTRAINT chk_total_copies
        CHECK (total_copies >= 1),

    CONSTRAINT chk_available_copies
        CHECK (available_copies >= 0
               AND available_copies <= total_copies)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- =====================================
-- Table 3: Loans
-- =====================================

CREATE TABLE loan (
    loan_id INT NOT NULL AUTO_INCREMENT,
    member_id VARCHAR(30) NOT NULL,
    isbn VARCHAR(30) NOT NULL,
    loan_days INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    status ENUM(
        'ACTIVE',
        'RETURNED'
    ) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (loan_id),

    CONSTRAINT fk_loan_member
        FOREIGN KEY (member_id)
        REFERENCES member(member_id),

    CONSTRAINT fk_loan_book
        FOREIGN KEY (isbn)
        REFERENCES book(isbn),

    CONSTRAINT chk_loan_days
        CHECK (loan_days BETWEEN 1 AND 30)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- =====================================
-- Table 4: Reservations
-- =====================================

CREATE TABLE reservation (
    reservation_id INT NOT NULL AUTO_INCREMENT,
    member_id VARCHAR(30) NOT NULL,
    isbn VARCHAR(30) NOT NULL,
    status ENUM(
        'PENDING',
        'PROCESSED',
        'CANCELLED'
    ) NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (reservation_id),

    CONSTRAINT fk_reservation_member
        FOREIGN KEY (member_id)
        REFERENCES member(member_id),

    CONSTRAINT fk_reservation_book
        FOREIGN KEY (isbn)
        REFERENCES book(isbn)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- =====================================
-- End of BookBridge Schema
-- =====================================
