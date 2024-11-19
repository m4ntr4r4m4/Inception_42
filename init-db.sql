-- Create databases

-- Create a user for WordPress with appropriate privileges
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON `${DB_DATABASE}`.* TO '${DB_USER}'@'%';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;

