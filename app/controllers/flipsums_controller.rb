class FlipsumsController < ApplicationController
  def new
    render "new"
  end

  def create
    quotes = [
      "I understand. You found paradise in America. You had a good trade, you made a good living. The police protected you and there were courts of law. So you didn't need a friend like me. Now you come and say \"Don Corleone, give me justice.\" But you don't ask with respect. You don't offer friendship. You don't even think to call me \"Godfather.\" You come into my house on the day my daughter is to be married and you ask me to do murder - for money.",
      "I have a sentimental weakness for my children and I spoil them, as you can see. They talk when they should listen. Anyway, Signor Sollozzo, my no to you is final. I want to congratulate you on your new business and I'm sure you'll do very well and good luck to you. Especially since your interests don't conflict with mine. Thank you.",
      "You talk about vengeance. Is vengeance going to bring your son back to you, or my boy to me? I forgo the vengeance of my son. But I have selfish reasons. My youngest son was forced to leave this country because of this Sollozzo business. All right, now I have to make arrangements to bring him back here safely cleared of all these false charges. But I'm a superstitious man, and if some unlucky accident should befall him... if he should be shot in the head by a police officer, or if he should hang himself in his jail cell, or if he's struck by a bolt of lightning, then I'm going to blame some of the people in this room, and that I do not forgive. But, that aside, let me say that I swear, on the souls of my grandchildren, that I will not be the one to break the peace we have made here today."
    ]

    @paragraphs = []
    number = params[:flipsum][:amount].to_i

    if params[:flipsum][:type] == "words"
      the_quote = quotes.sample.split(" ")
      words = the_quote[0..(number - 1)].join(" ")
      @paragraphs.push(words)
    else
      amount_minus_one = (number.to_f / quotes.length).floor

      amount_minus_one.times do
        quotes.each do |one_quote|
          @paragraphs.push(one_quote)
        end
      end

      if @paragraphs.length < number
        extra = number - @paragraphs.length

        extra.times do |i|
          @paragraphs.push(quotes[i])
        end
      end
    end

    render "results"
  end
end
