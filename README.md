# README

# Ruby on Rails: Item Soft Delete Functionality

This Ruby on Rails application demonstrates a custom soft delete mechanism implemented in the `Item` model, allowing items to be marked as deleted without physically removing them from the database.

## Implementation Overview

### Model: `Item`
- **Attributes:**
  - `name`: String - The name of the item.
  - `deleted_at`: DateTime - Timestamp indicating when the item was soft-deleted.
- **Migration:**
  ```ruby
  create_table :items do |t|
    t.string :name
    t.datetime :deleted_at
    t.timestamps
  end

### Soft Delete Mechanism
Implemented in the `Item` model.
- **Methods:**
  - `soft_delete`: Marks the item as deleted by setting `deleted_at` to the current timestamp.
  - `restore`: Sets `deleted_at` to `nil`, restoring the item.

### Default Scope
A default scope in the `Item` model excludes soft-deleted items from regular ActiveRecord queries.
```ruby
default_scope { where(deleted_at: nil) }

### Testing with RSpec
Comprehensive tests ensure functionality:
- Soft deleting an item.
- Restoring a soft-deleted item.
- Excluding soft-deleted items from normal queries.

## Setup and Execution

### Prerequisites

- Ruby on Rails
- SQLite3 (or other configured databases)
- RSpec for testing

### Getting Started

1. Clone the repository:

   ```
   git clone https://github.com/Soumyajit567/Soumyajit-Ruby-on-Rails.git
   ```

2. Navigate to the App Directory:
   
   ```
   cd Soumyajit-Ruby-on-Rails
   ```

3. Install Dependencies:
   
   ```
   bundle install
   ```

4. Setup Database:
   
   ```
   rails db:create
   rails db:migrate

   ```
5. Run the Application

   ```
   rails server
   ```

6. Running Tests
   Execute RSpec tests:

   ```
   bundle exec rspec

   ```
