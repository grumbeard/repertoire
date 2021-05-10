# REPERTOIRE
## Private social network for sharing food discoveries

**Project Status**: *Development Ongoing*

**Goal**: Design and build a web application to practice full-stack development as part of [TechLadies Mentorship Programme](https://techladies.co/mentorship-2/) (2020)

**Live Link**: 👉 http://rep-er-toire.herokuapp.com

## About Repertoire
Repertoire is an app that allows you to Own, Document, and Share your food discoveries.

### Why Another Food App?
Everyone has made a few discoveries… which they struggle to remember. Social media and review sites are commonly used to find and share food discoveries but don't always provide the best experience.

*Public reviews aren’t the most reliable source of **second-hand** discoveries*
- You’re a stranger to a stranger’s tastes
- Overhyped places tend to bring in more crowds
- Incentivised reviews may not be trustworthy

*Public reviews aren’t the most appropriate way to capture your **first-hand** discoveries*
- You don’t actually want to leave a review
- You don’t want to sign up for an account
- You want to separate what’s personal or communal / intimate, from what is public

Your food discoveries belong to you and the people you share them with
- They should be captured and shared **in the right context**.
- They retain their value when they **belong to people you value**.
- They are part of a **personal compendium** of your larger life experience.

### Key Features
- Capture photo or upload image with device to create a 'story'
- Automatically capture contextual details of 'story' with suggested tags
- Edit 'story' to keep tabs on price and approval ratings
- Add / Create / Delete tags for 'ambience', 'location', and 'feelings' associated with 'story'
- Scroll through your collection of stories
- [FUTURE] Share your repertoire with people as they enter your life from different contexts (share by collection / tags, invite others to contribute to a private collection)

## Technologies
- **Framework**: Ruby on Rails (transitioning to ReactJS frontend)
- **Database**: PostgreSQL
- **Frontend**: HTML, CSS / SCSS, JavaScript ES6, Font Awesome
- **APIs**: Navigator, Geocoder (gem), Unsplash, Cloudinary (gem) with Active Storage
- **Authentication**: Devise (gem)

## Screenshots
![image](https://user-images.githubusercontent.com/51464365/117606319-348b1500-b18c-11eb-99bb-71444f3ea2ec.png)
![image](https://user-images.githubusercontent.com/51464365/117606382-57b5c480-b18c-11eb-95a6-398e41d5c291.png)


## Process
- Wireframed and prototyped 2 core user journeys on Figma
- Mapped out DB schema
- Built out backend on Rails (first user journey)
- Wired up image hosting on Cloudinary
- Styled all elements (not responsive yet)
- [FUTURE] Rebuild frontend on ReactJS (for practice)
- [FUTURE] Build out second user journey

## Key Learnings
- Relearned the basics of Rails (Migration, Routing, Input Validation, etc.)
- Simultaneous forward and reverse geocoding
- Inserting form values dynamically via JavaScript
- Overriding browser default styling of form components
- Debugging with ByeBug
- [Ongoing] Getting a Ruby on Rails app to use a different frontend (ReactJS)
