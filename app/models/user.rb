class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy


  after_initialize :initial

  validates :name, presence: true
  validates :posts_counter, allow_blank: false, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def initial
    self.photo ||= 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWI
  B0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N
  zc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAIoAigMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABQYBAwQCB//EADsQAAIBAgMFB
  AYGCwAAAAAAAAABAgMEBREhEhMxQVEiI3GxBjJSYYGRFEJTodHhFSQzNUNicoKSwfD/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAA
  AAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8A+4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAByXmIW1mu+n2stILVsjMWxrZcqFk9VpKp08CAlJyk5
  SbbfFt6sCYufSGtNtW9KMI9Zasj6mIXlXPbuavgnl5HMANm/rfbVP8ANnune3VP1Liqv7maABKUMdvKbW92KseeayfzRMWWM2t01By3VR/Vn
  z8GVMAX4FVwzGKtq1Trt1KPDXjHwLPSqwrU41KUlKElmmgPYAAAAAAABA4/ibjnaUJa/wASS5e4k8Tu1ZWc6um1wgnzZTZOUpOUnnJvNt82B
  gAAADfbWVxdPuaba5ybySA0AlFgdxlrVpJ9NTnucMurdbUobUfag8/u4gcYAAEjg+IuyrbFR9xN9r+V9SOAF9i1JJppprNNGSG9HLze0ZW03
  2qXq++P5EyAAAAAAVr0muHK5p0E9Kcdp+L/AC8yGOnE6m9xC4ln9dpfDQ5gAAA7sKsvpdZuee6hrL3+4ssIxhFRglGK4JcEceDU1Tw+m0tZ5
  yf/AHwR2gAABC43h8YxdzQWX2kV5kKXOcFUhKElpJNP4lNlHZk10eQGAAB1YZcfRr6lU5bWzLwehdCgF5s6m9tKNR8ZQTfyA3AAAAAKLcPO4
  q/1y8zWb7+G7vq8OlR+ZoAGDJgCz4PVjPDqWusM4s7dqPUrOFXqtarjU/ZT4v2X1LKkpRTjJNPVNcwM7SfBmHJcnqFDmNlaLoB5dRQjKc2lF
  Jv5FPlLak31eZM41ewUXbUZbTb7xrkuhCgZBgyALlhH7sts/YRTS7YdDd2FvHpTj5AdAAAAACq+kdHd4hvMuzVinn71o/8ARFlsx60d1ZNwW
  dSn2o5c+qKmAAJHDcMldZVarcaP3y8PxA4aNGpWns0oSm+kUd0P0lhq9WW76ZbUfyLBSpU6MNilBRiuSR7AgVj1RLWhBvrtM8TvsQv+xQjKM
  Xx2F5sn3CDfqx+R6Wmi0QFSubO4tn31Npe1xXzNBdGk01JJp8UyGxHCItOraRyfF01z8PwAhAOGgA22lF3FzSor68kn4cy8JZLLoV/0atG5y
  uprRdmHjzZYQAAAAAAVXHMOdrWdalHuZvkvVfQtR4q0oVqcqdSKlCSyaYFQwuz+mXGUl3UNZvr0RZ0lGKjFJJaJI12tjCxpOFLNxcm23xNoA
  AAAAAAAEJjlio/rVKOSb7xLzI6xtJ3txGlDNLjKWXqotc6Kr05U5LsyWTPVhZUrKju6S1espPjJgbaFGFClClTWUYrJGwAAAAAAAAAAa5Uk9
  Y6M2ADncWuKPJ1GHFPikBzA6N3H2TKjFcEgOdJvgjZGl7T+BtAGEklojIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB//Z'
  end
end
