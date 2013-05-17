require "spec_helper"

describe Post do
  describe "#lead" do
    it 'returns the first 300 characters of the post body' do
      body = ''
      400.times do
        body << 'a'
      end

      post = Post.create!(title: "A post", body: body)

      expect(post.lead.length).to eq(303)
    end

    it 'returns the full body if less than 300 characters' do
      body = ''
      200.times do
        body << 'a'
      end

      post = Post.create!(title: "A post", body: body)

      expect(post.lead.length).to eq(200)
      end
    end
  end
