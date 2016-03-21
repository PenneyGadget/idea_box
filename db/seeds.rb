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
        body: "A very good idea so as to not go cray-cray."
      },
      {
        title: "Eating",
        body: "This is probably a good thing to do from time to time."
      },
      {
        title: "Voting",
        body: "Meh. The system be broke, yo."
      },
      {
        title: "Rock Climbing",
        body: "Only the very best idea ever."
      },
      {
        title: "Bringing down the system",
        body: "Imperative."
      },
      {
        title: "Putting on shoes",
        body: "Of varied importance."
      },
      {
        title: "Being an insensitive jerk",
        body: "Not a good idea."
      },
      {
        title: "Cooking",
        body: "Yay!"
      },
      {
        title: "Showering",
        body: "Fun and rejuvenating, but not strictly necessary."
      },
      {
        title: "Caffeinating",
        body: "Adrenals say no, rest of body says yes."
      }
      ])
  end
end

Seed.start
