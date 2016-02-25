module ApplicationHelper
  def voted? opinion
    voted_opinions = JSON.parse(cookies[:voted_opinions_x] || "{}")
    voted_opinions.has_key? opinion.id.to_s
  end

  def agreed? opinion
    voted_opinions = JSON.parse(cookies[:voted_opinions_x] || "{}")
    voted_opinions.has_key?(opinion.id.to_s) and voted_opinions[opinion.id.to_s] == 'agree'
  end

  def disagreed? opinion
    voted_opinions = JSON.parse(cookies[:voted_opinions_x] || "{}")
    voted_opinions.has_key?(opinion.id.to_s) and voted_opinions[opinion.id.to_s] == 'disagree'
  end
end
