# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


#	fx : user生成
#		@props {name : ユーザー名}
#		@returns { obj : 作成したユーザー }
def	createUser(name = 'sato')
	user = User.create!(name: "#{name}", email: "#{name}@email", password: 'password')

	return user
end

#	fx : post生成
#		@props {user: ユーザー, text: 投稿内容 }
#		@returns { obj : 作成した投稿 }
def	createPost(user, text)
	post = Post.create!(user_id: user.id, text: text)

	return post
end

#	array : 挨拶集
greetings = [
	"hello!",
	"nice to meet you.",
	"how are you?",
	#"good morning!",
	#"good afternoon!",
	#"good evening!",
]

5.times do |i|
	user = createUser(i)

	greetings.each { |greeting|
		createPost(user, "i'm #{user.name}. #{greeting}")
	}
end
