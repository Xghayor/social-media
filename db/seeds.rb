# Create users
first_user = User.create(name: 'Tom', photo: 'https://url-to-tom-photo.jpg', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://url-to-lilly-photo.jpg', bio: 'Teacher from Poland.')

# Create posts by users
first_post = Post.create(author: first_user, title: 'Hello from Tom', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author: second_user, title: 'Hello from Lilly', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author: second_user, title: 'Another post from Lilly', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author: first_user, title: 'Another post from Tom', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)

# Create comments
Comment.create(post: first_post, user: first_user, text: 'Hi Tom!')
Comment.create(post: second_post, user: second_user, text: 'Hi Lilly!')
Comment.create(post: second_post, user: first_user, text: 'Hi Tom 2!')
Comment.create(post: second_post, user: second_user, text: 'Hi Tom 3!')
Comment.create(post: first_post, user: first_user, text: 'Hi Lilly!')
Comment.create(post: first_post, user: second_user, text: 'Hi Tom!')
