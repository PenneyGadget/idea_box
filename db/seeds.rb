class Seed
  def self.start
    new.generate
  end

  def generate
    create_ideas
  end

  def create_ideas
    Idea.create!([
      {
        title: "Sleeping",
        body: "A very good idea so as to not go cray-cray.",
        quality: 2
      },
      {
        title: "Eating",
        body: "This is probably a good thing to do from time to time.",
        quality: 1
      },
      {
        title: "Voting",
        body: "Meh. The system be broke, yo."
      },
      {
        title: "Rock Climbing",
        body: "Only the very best idea ever.",
        quality: 2
      },
      {
        title: "Bringing down the system",
        body: "Imperative.",
        quality: 2
      },
      {
        title: "Putting on shoes",
        body: "Of varied importance.",
        quality: 1
      },
      {
        title: "Being an insensitive jerk",
        body: "Not a good idea."
      },
      {
        title: "Cooking",
        body: "Yay!",
        quality: 2
      },
      {
        title: "Showering",
        body: "Fun and rejuvenating, but not strictly necessary.",
        quality: 1
      },
      {
        title: "Caffeinating",
        body: "Adrenals say no, rest of body says yes.",
        quality: 1
      }
      ])
  end
end

Seed.start
