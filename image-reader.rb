puts 'helloooooooooo'
filenames = Dir.entries('assets/images/speakers').select { |x| x.include? '-'}
# puts filenames
i = 0
fn = []
ln = []
mn = []
names = []
filenames.each do |f|
    fn = f.split('-')[0]
    if f.split('-')[2]
        mn = f.split('-')[1]
        ln = f.split('-')[2].to_s.split('.')[0]
        alt_text = "#{fn.capitalize} #{mn.capitalize} #{ln.capitalize}"
        twitter = "https://twitter.com/#{fn}#{mn}#{ln}\">@#{fn}#{mn}#{ln}"
        website = "http://#{fn}#{mn}#{ln}.com/\">#{fn}#{mn}#{ln}.com"
    else
        mn = ""
        ln = f.split('-')[1].to_s.split('.')[0]
        alt_text = "#{fn.capitalize} #{ln.capitalize}"
        twitter = "https://twitter.com/#{fn}#{ln}\">@#{fn}#{ln}"
        website = "http://#{fn}#{ln}.com/\">#{fn}#{ln}.com"
    end

    path = "assets/images/speakers/#{f}"
    names[i] = [path, alt_text, twitter, website]
    File.open("names.txt", "a") { |f| f.write "#{names[i]}\n\n\n"}
    i = i + 1



end

names.each do |n|
    puts "#{n[0]}             #{n[1]}          #{n[2]}                  #{n[3]}"

end



