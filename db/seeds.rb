# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Survey.create title: 'No question about it', description: 'This survey has no questions'
memes = Survey.create title: 'Your thoughts on Internet memes',
                      description: 'Internet memes are everywhere...how do you feel about them?'

fav_meme = MultiChoiceQuestion.new body: 'What is your favorite meme?'
fav_meme.question_options.build([
                                  { body: 'Grumpy cat' },
                                  { body: 'Success kid' },
                                  { body: 'Most interesting man' },
                                  { body: 'Philosoraptor' }
                                ])
fav_meme.save

least_fav_meme = MultiChoiceQuestion.new body: 'What is your least favorite meme?'
least_fav_meme.question_options.build([
                                        { body: 'Numa numa' },
                                        { body: 'Dancing baby' },
                                        { body: 'Girl on fire' },
                                        { body: 'Peanut butter jelly time' },
                                        { body: 'Star Wars kid' },
                                        { body: 'Cat on fan' }
                                      ])
least_fav_meme.save

new_meme_feels = MultiChoiceQuestion.new body: 'What feelings do you have when you see a new meme?',
                                         multipart: true
new_meme_feels.question_options.build([
                                        { body: 'Unrestrained joy' },
                                        { body: 'Fear of change' },
                                        { body: 'Suspicion' },
                                        { body: 'Apprehension' }
                                      ])
new_meme_feels.save

memes.questions = [fav_meme, least_fav_meme, new_meme_feels]

holy_grail = Survey.create title: 'The Bridge of Death',
                           description: "Who would cross the Bridge of Death must answer me these questions three, 'ere the other side he see."
name = MultiChoiceQuestion.new body: 'What is your name?'
name.question_options.build([
                              { body: 'Sir Galahad of Camelot' },
                              { body: 'Sir Launcelot of Camelot' },
                              { body: 'Sir Robin of Camelot' },
                              { body: 'It is Arthur, King of the Britons' }
                            ])
name.save

quest = MultiChoiceQuestion.new body: 'What is your quest?'
quest.question_options.build([
                               { body: 'To seek the Holy Grail' },
                               { body: 'To avoid this silliness' }
                             ])
quest.save

color = MultiChoiceQuestion.new body: 'What is your favorite color?'
color.question_options.build([
                               { body: 'blue' },
                               { body: 'green' },
                               { body: 'Blue. No yel-- Auuuuuuuugh!' },
                               { body: 'Auuuuuuuugh!' }
                             ])
color.save

assyria = MultiChoiceQuestion.new body: 'What is the capital of Assyria?',
                                  multipart: true
assyria.question_options.build([
                                 { body: "I don't know that!" },
                                 { body: 'Assur' },
                                 { body: 'Nineveh' },
                                 { body: 'Auuuuuuuugh!' }
                               ])
assyria.save

swallow = MultiChoiceQuestion.new body: 'What is the air-speed velocity of an unladen swallow?'
swallow.question_options.build([
                                 { body: '34 kph' },
                                 { body: 'What do you mean? An African or European swallow?' }
                               ])
swallow.save

silly = MultiChoiceQuestion.create body: "'Tis a silly question.", required: false

holy_grail.questions = [name, quest, color, assyria, swallow, silly]
