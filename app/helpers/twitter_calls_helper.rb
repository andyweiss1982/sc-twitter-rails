module TwitterCallsHelper

  def tweet_time(tweet_created_at)
    tweet_created_at.dup.localtime.strftime("%b %d, %Y %l:%M%p")
  end

  def parse_mentions(tweet_text)
    tweet_text.split(" ").map do |word|
      if word[0] == "@"
        stripped_word = strip_punctuation(word)
        word = link_to(
          word, 
          twitter_calls_path(
            twitter_call: { handle: stripped_word[1..-1] }
          ), 
          method: 'post'
        )
      elsif word.include?('http') || word.include?('www.')
        word = link_to(word, word, target: "_blank")
      else
        word = word
      end
    end.join(" ").html_safe
  end

  def strip_punctuation(word)
    word[0..-1].split(/[:'.,!?]/).first
  end

end
