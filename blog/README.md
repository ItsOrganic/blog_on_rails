# Blog on Rails

## Introduction

**Blog on Rails** is a Ruby on Rails application designed for efficiently managing and publishing blog posts. The project supports user authentication, post creation, editing, publishing, and public/private post viewing. It is built with modularity in mind, using Devise for authentication and Rails conventions for routing and controllers.

---

## Architecture Diagram

```
+-------------------------+
|      Users (Web)        |
+-----------+-------------+
            |
            v
+-------------------------+
|   Devise Authentication |
+-----------+-------------+
            |
            v
+-------------------------+
| BlogPostsController     |
|  - Create/Edit/Update   |
|  - Show/Index           |
|  - Destroy              |
+-----------+-------------+
            |
            v
+-------------------------+
|  ActiveRecord Models    |
+-----------+-------------+
            |
            v
+-------------------------+
|      Database           |
+-------------------------+
```

---

## Endpoints and Usage

All endpoints are RESTful, following Rails conventions.

| Method | Path                | Action   | Description                                       | Auth Required |
|--------|---------------------|----------|---------------------------------------------------|--------------|
| GET    | `/blog_posts`       | index    | List all blog posts (or only published if not signed in) | No           |
| GET    | `/blog_posts/:id`   | show     | Show a specific blog post                         | No           |
| GET    | `/blog_posts/new`   | new      | Form for creating a new blog post                 | Yes          |
| POST   | `/blog_posts`       | create   | Create a new blog post                            | Yes          |
| GET    | `/blog_posts/:id/edit` | edit  | Form to edit a blog post                          | Yes          |
| PATCH/PUT | `/blog_posts/:id`| update   | Update a blog post                                | Yes          |
| DELETE | `/blog_posts/:id`   | destroy  | Delete a blog post                                | Yes          |

- The root URL `/` maps to the blog posts index.
- Authentication is managed via Devise (`/users/sign_in`, `/users/sign_up`, etc.).
- Only authenticated users can create, edit, update, or destroy posts.
- Guests (not signed in) can view only published posts.

---

## Authentication

- Handled by Devise.
- You must sign in or sign up to create or manage blog posts.
- Unauthenticated users have read-only access to published posts.

---

## Controllers

**BlogPostsController**  
Handles all blog post CRUD operations.  
Key filters:
- `before_action :authenticate_user!` - restricts creation, editing, updating, and deletion to authenticated users.
- `before_action :set_blog_find` - fetches the correct post depending on authentication and published status.

---

## Example Usage

**Get all published blog posts (not signed in):**
```http
GET /blog_posts
```

**Create a new blog post (signed in):**
```http
POST /blog_posts
Headers: { Cookie: [your_session] }
Body: {
  "blog_posts": {
    "title": "My First Post",
    "body": "Hello World!",
    "published_at": "2025-07-12"
  }
}
```

---

## Development

- Ruby on Rails
- Devise for authentication
- Stimulus for JavaScript controllers

---

## Configuration

- Local development runs on `localhost:3000`.
- See `config/environments/development.rb` for environment settings.

---

## More Information

- [Full Source Code](https://github.com/ItsOrganic/blog_on_rails/tree/51028cd16af3f6607e5265c9c704df62fc63280a/blog)
- [Code Search Results for More Details](https://github.com/ItsOrganic/blog_on_rails/search?q=endpoint+OR+route+OR+API+OR+controller+OR+usage+OR+architecture+OR+diagram)

> **Note:** This document is based on a partial code search and may not cover all project features.