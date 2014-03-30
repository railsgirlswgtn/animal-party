WORDS_TO_AWESOMENESS_RATIO = 40

describe "The never ending story" do

  let(:story_path) { "story.md" }

  let(:text)  { File.open(story_path).read }
  let(:lines) { IO.readlines(story_path) }

  it "exists" do
    expect(File.exists? story_path).to eq(true)
  end

  it "has at least 10 lines" do
    expect(lines.length).to be > 10
  end

  it "has the required amount of sweet sweet gifs" do
    num_words = text.split.count
    num_gifs = text.scan(/\.gif/).count
    words_to_awesomeness_ratio = num_words / num_gifs

    expect(words_to_awesomeness_ratio).to be <= WORDS_TO_AWESOMENESS_RATIO
  end

  it "has animals" do
    animal_mentions = text.scan(/animal/i).count
    expect(animal_mentions).to be > 0
  end

  it "mentions a party" do
    party_mentions = text.scan(/party/i).count
    expect(party_mentions).to be > 0
  end
end
