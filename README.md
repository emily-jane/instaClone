## InstaClone

### Brief

- To build a clone of Instagram using ruby on rails.
- Users can post pictures, write comments on pictures, and like a picture.
- Style it like Instagram's website (or similar).

### Technologies

Built using Ruby on Rails, with PostgreSQL for the database, jQuery for the image likes feature, and ImageMagick for image uploading. It was styled using Foundation, and tested using RSpec.


### Installation:

```
git clone https://github.com/emily-jane/instaClone
cd instaClone
brew install imagemagick
bundle install
rake db:create
rake db:migrate
rails s
```
### And to run tests:

`rspec`

### Future versions

- Sign in with Facebook
- Display username with comment
- Ability to comment on image on main page
- Only show latest three comments, not all of them
