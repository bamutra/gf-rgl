--# -path=.:prelude

concrete LexiconEng of Lexicon = CatEng ** 
  open ParadigmsEng, IrregEng, Prelude in {

flags 
  optimize=values ;

lin
  airplane_N = regN "airplane" ;
  answer_V2S = mkV2S (regV "answer") toP ;
  apartment_N = regN "apartment" ;
  apple_N = regN "apple" ;
  art_N = regN "art" ;
  ask_V2Q = mkV2Q (regV "ask") noPrep ;
  baby_N = regN "baby" ;
  bad_A = mkADeg "bad" "badly" "worse" "worst" ;
  bank_N = regN "bank" ;
  beautiful_A = regADeg "beautiful" ;
  become_VA = mkVA (irregV "become" "became" "become") ;
  beer_N = regN "beer" ;
  beg_V2V = mkV2V (regDuplV "beg") noPrep toP ;
  big_A = duplADeg "big" ;
  bike_N = regN "bike" ;
  bird_N = regN "bird" ;
  black_A = regADeg "black" ;
  blue_A = regADeg "blue" ;
  boat_N = regN "boat" ;
  book_N = regN "book" ;
  boot_N = regN "boot" ;
  boss_N = regN "boss" ;
  boy_N = regN "boy" ;
  bread_N = regN "bread" ;
  break_V2 = dirV2 (irregV "break" "broke" "broken") ;
  broad_A = regADeg "broad" ;
  brother_N2 = regN2 "brother" ;
  brown_A = regADeg "brown" ;
  butter_N = regN "butter" ;
  buy_V2 = dirV2 (irregV "buy" "bought" "bought") ;
  camera_N = regN "camera" ;
  cap_N = regN "cap" ;
  car_N = regN "car" ;
  carpet_N = regN "carpet" ;
  cat_N = regN "cat" ;
  ceiling_N = regN "ceiling" ;
  chair_N = regN "chair" ;
  cheese_N = regN "cheese" ;
  child_N = mk2N "child" "children" ;
  church_N = regN "church" ;
  city_N = regN "city" ;
  clean_A = regADeg "clean" ;
  clever_A = regADeg "clever" ;
  close_V2 = dirV2 (regV "close") ;
  coat_N = regN "coat" ;
  cold_A = regADeg "cold" ;
  come_V = (irregV "come" "came" "come") ;
  computer_N = regN "computer" ;
  country_N = regN "country" ;
  cousin_N = regN "cousin" ;
  cow_N = regN "cow" ;
  die_V = (regV "die") ;
  dirty_A = regADeg "dirty" ;
  distance_N3 = mkN3 (regN "distance") fromP toP ;
  doctor_N = regN "doctor" ;
  dog_N = regN "dog" ;
  door_N = regN "door" ;
  drink_V2 = dirV2 (irregV "drink" "drank" "drunk") ;
  easy_A2V = mkA2V (regA "easy") forP ;
  eat_V2 = dirV2 (irregV "eat" "ate" "eaten") ;
  empty_A = regADeg "empty" ;
  enemy_N = regN "enemy" ;
  factory_N = regN "factory" ;
  father_N2 = regN2 "father" ;
  fear_VS = mkVS (regV "fear") ;
  find_V2 = dirV2 (irregV "find" "found" "found") ;
  fish_N = mk2N "fish" "fish" ;
  floor_N = regN "floor" ;
  forget_V2 = dirV2 (irregDuplV "forget" "forgot" "forgotten") ;
  fridge_N = regN "fridge" ;
  friend_N = regN "friend" ;
  fruit_N = regN "fruit" ;
  fun_AV = mkAV (regA "fun") ;
  garden_N = regN "garden" ;
  girl_N = regN "girl" ;
  glove_N = regN "glove" ;
  gold_N = regN "gold" ;
  good_A = mkADeg "good" "well" "better" "best" ;
  go_V = mk5V "go" "goes" "went" "gone" "going" ;
  green_A = regADeg "green" ;
  harbour_N = regN "harbour" ;
  hate_V2 = dirV2 (regV "hate") ;
  hat_N = regN "hat" ;
  have_V2 = dirV2 (mk5V "have" "has" "had" "had" "having") ;
  hear_V2 = dirV2 (irregV "hear" "heard" "heard") ;
  hill_N = regN "hill" ;
  hope_VS = mkVS (regV "hope") ;
  horse_N = regN "horse" ;
  hot_A = duplADeg "hot" ;
  house_N = regN "house" ;
  important_A = compoundADeg (regA "important") ;
  industry_N = regN "industry" ;
  iron_N = regN "iron" ;
  king_N = regN "king" ;
  know_V2 = dirV2 (irregV "know" "knew" "known") ;
  lake_N = regN "lake" ;
  lamp_N = regN "lamp" ;
  learn_V2 = dirV2 (regV "learn") ;
  leather_N = regN "leather" ;
  leave_V2 = dirV2 (irregV "leave" "left" "left") ;
  like_V2 = dirV2 (regV "like") ;
  listen_V2 = prepV2 (regV "listen") toP ;
  live_V = (regV "live") ;
  long_A = regADeg "long" ;
  lose_V2 = dirV2 (irregV "lose" "lost" "lost") ;
  love_N = regN "love" ;
  love_V2 = dirV2 (regV "love") ;
  man_N = mk2N "man" "men" ;
  married_A2 = mkA2 (regA "married") toP ;
  meat_N = regN "meat" ;
  milk_N = regN "milk" ;
  moon_N = regN "moon" ;
  mother_N2 = regN2 "mother" ;
  mountain_N = regN "mountain" ;
  music_N = regN "music" ;
  narrow_A = regADeg "narrow" ;
  new_A = regADeg "new" ;
  newspaper_N = regN "newspaper" ;
  oil_N = regN "oil" ;
  old_A = regADeg "old" ;
  open_V2 = dirV2 (regV "open") ;
  paint_V2A = mkV2A (regV "paint") noPrep ;
  paper_N = regN "paper" ;
  paris_PN = regPN "Paris" ;
  peace_N = regN "peace" ;
  pen_N = regN "pen" ;
  planet_N = regN "planet" ;
  plastic_N = regN "plastic" ;
  play_V2 = dirV2 (regV "play") ;
  policeman_N = regN "policeman" ;
  priest_N = regN "priest" ;
  probable_AS = mkAS (regA "probable") ;
  queen_N = regN "queen" ;
  radio_N = regN "radio" ;
  rain_V0 = mkV0 (regV "rain") ;
  read_V2 = dirV2 (irregV "read" "read" "read") ;
  red_A = duplADeg "red" ;
  religion_N = regN "religion" ;
  restaurant_N = regN "restaurant" ;
  river_N = regN "river" ;
  rock_N = regN "rock" ;
  roof_N = regN "roof" ;
  rubber_N = regN "rubber" ;
  run_V = (irregDuplV "run" "ran" "run") ;
  say_VS = mkVS (irregV "say" "said" "said") ;
  school_N = regN "school" ;
  science_N = regN "science" ;
  sea_N = regN "sea" ;
  seek_V2 = dirV2 (irregV "seek" "sought" "sought") ;
  see_V2 = dirV2 (irregV "see" "saw" "seen") ;
  sell_V3 = dirV3 (irregV "sell" "sold" "sold") toP ;
  send_V3 = dirV3 (irregV "send" "sent" "sent") toP ;
  sheep_N = mk2N "sheep" "sheep" ;
  ship_N = regN "ship" ;
  shirt_N = regN "shirt" ;
  shoe_N = regN "shoe" ;
  shop_N = regN "shop" ;
  short_A = regADeg "short" ;
  silver_N = regN "silver" ;
  sister_N = regN "sister" ;
  sleep_V = (irregV "sleep" "slept" "slept") ;
  small_A = regADeg "small" ;
  snake_N = regN "snake" ;
  sock_N = regN "sock" ;
  speak_V2 = dirV2 (irregV "speak" "spoke" "spoken") ;
  star_N = regN "star" ;
  steel_N = regN "steel" ;
  stone_N = regN "stone" ;
  stove_N = regN "stove" ;
  student_N = regN "student" ;
  stupid_A = regADeg "stupid" ;
  sun_N = regN "sun" ;
  switch8off_V2 = dirV2 (partV (regV "switch") "off") ;
  switch8on_V2 = dirV2 (partV (regV "switch") "on") ;
  table_N = regN "table" ;
  talk_V3 = mkV3 (regV "talk") toP aboutP ;
  teacher_N = regN "teacher" ;
  teach_V2 = dirV2 (irregV "teach" "taught" "taught") ;
  television_N = regN "television" ;
  thick_A = regADeg "thick" ;
  thin_A = duplADeg "thin" ;
  train_N = regN "train" ;
  travel_V = (regDuplV "travel") ;
  tree_N = regN "tree" ;
 ---- trousers_N = regN "trousers" ;
  ugly_A = regADeg "ugly" ;
  understand_V2 = dirV2 (irregV "understand" "understood" "understood") ;
  university_N = regN "university" ;
  village_N = regN "village" ;
  wait_V2 = prepV2 (regV "wait") forP ;
  walk_V = (regV "walk") ;
  warm_A = regADeg "warm" ;
  war_N = regN "war" ;
  watch_V2 = dirV2 (regV "watch") ;
  water_N = regN "water" ;
  white_A = regADeg "white" ;
  window_N = regN "window" ;
  wine_N = regN "wine" ;
  win_V2 = dirV2 (irregDuplV "win" "won" "won") ;
  woman_N = mk2N "woman" "women" ;
  wonder_VQ = mkVQ (regV "wonder") ;
  wood_N = regN "wood" ;
  write_V2 = dirV2 (irregV "write" "wrote" "written") ;
  yellow_A = regADeg "yellow" ;
  young_A = regADeg "young" ;

  do_V2 = dirV2 (mk5V "do" "does" "did" "done" "doing") ;
  now_Adv = mkAdv "now" ;
  already_Adv = mkAdv "already" ;
  song_N = regN "song" ;
  add_V3 = dirV3 (regV "add") toP ;
  number_N = regN "number" ;
  put_V2 = prepV2 (irregDuplV "put" "put" "put") noPrep ;
  stop_V = regDuplV "stop" ;
  jump_V = regV "jump" ;

  left_Ord = ss "left" ;
  right_Ord = ss "right" ;
  far_Adv = mkAdv "far" ;
  correct_A = (regA "correct") ;
  dry_A = regA "dry" ;
  dull_A = regA "dull" ;
  full_A = regA "full" ;
  heavy_A = regA "heavy" ;
  near_A = regA "near" ;
  rotten_A = (regA "rotten") ;
  round_A = regA "round" ;
  sharp_A = regA "sharp" ;
  smooth_A = regA "smooth" ;
  straight_A = regA "straight" ;
  wet_A = regA "wet" ; ----
  wide_A = regA "wide" ;
  animal_N = regN "animal" ;
  ashes_N = regN "ash" ; -- FIXME: plural only?
  back_N = regN "back" ;
  bark_N = regN "bark" ;
  belly_N = regN "belly" ;
  blood_N = regN "blood" ;
  bone_N = regN "bone" ;
  breast_N = regN "breast" ;
  cloud_N = regN "cloud" ;
  day_N = regN "day" ;
  dust_N = regN "dust" ;
  ear_N = regN "ear" ;
  earth_N = regN "earth" ;
  egg_N = regN "egg" ;
  eye_N = regN "eye" ;
  fat_N = regN "fat" ;
  feather_N = regN "feather" ;
  fingernail_N = regN "fingernail" ;
  fire_N = regN "fire" ;
  flower_N = regN "flower" ;
  fog_N = regN "fog" ;
  foot_N = mk2N "foot" "feet" ;
  forest_N = regN "forest" ;
  grass_N = regN "grass" ;
  guts_N = regN "gut" ; -- FIXME: no singular
  hair_N = regN "hair" ;
  hand_N = regN "hand" ;
  head_N = regN "head" ;
  heart_N = regN "heart" ;
  horn_N = regN "horn" ;
  husband_N = genderN masculine (regN "husband") ;
  ice_N = regN "ice" ;
  knee_N = regN "knee" ;
  leaf_N = mk2N "leaf" "leaves" ;
  leg_N = regN "leg" ;
  liver_N = regN "liver" ;
  louse_N = mk2N "louse" "lice" ;
  mouth_N = regN "mouth" ;
  name_N = regN "name" ;
  neck_N = regN "neck" ;
  night_N = regN "night" ;
  nose_N = regN "nose" ;
  person_N = genderN human (regN "person") ;
  rain_N = regN "rain" ;
  road_N = regN "road" ;
  root_N = regN "root" ;
  rope_N = regN "rope" ;
  salt_N = regN "salt" ;
  sand_N = regN "sand" ;
  seed_N = regN "seed" ;
  skin_N = regN "skin" ;
  sky_N = regN "sky" ;
  smoke_N = regN "smoke" ;
  snow_N = regN "snow" ;
  stick_N = regN "stick" ;
  tail_N = regN "tail" ;
  tongue_N = regN "tongue" ;
  tooth_N = mk2N "tooth" "teeth" ;
  wife_N = genderN feminine (mk2N "wife" "wives") ;
  wind_N = regN "wind" ;
  wing_N = regN "wing" ;
  worm_N = regN "worm" ;
  year_N = regN "year" ;
  blow_V = blow_V ;
  breathe_V = dirV2 (regV "breathe") ;
  burn_V = burn_V ;
  dig_V = dig_V ;
  fall_V = fall_V ;
  float_V = regV "float" ;
  flow_V = regV "flow" ;
  fly_V = fly_V ;
  freeze_V = freeze_V ;
  give_V3 = dirV3 give_V toP ;
  laugh_V = regV "laugh" ;
  lie_V = lie_V ;
  play_V = regV "play" ;
  sew_V = sew_V ;
  sing_V = sing_V ;
  sit_V = sit_V ;
  smell_V = regV "smell" ;
  spit_V = spit_V ;
  stand_V = stand_V ;
  swell_V = swell_V ;
  swim_V = swim_V ;
  think_V = think_V ;
  turn_V = regV "turn" ;
  vomit_V = regV "vomit" ;

  bite_V2 = dirV2 bite_V ;
  count_V2 = dirV2 (regV "count") ;
  cut_V2 = dirV2 cut_V ;
  fear_V2 = dirV2 (regV "fear") ;
  fight_V2 = dirV2 fight_V ;
  hit_V2 = dirV2 hit_V ;
  hold_V2 = dirV2 hold_V ;
  hunt_V2 = dirV2 (regV "hunt") ;
  kill_V2 = dirV2 (regV "kill") ;
  pull_V2 = dirV2 (regV "pull") ;
  push_V2 = dirV2 (regV "push") ;
  rub_V2 = dirV2 (regDuplV "rub") ;
  scratch_V2 = dirV2 (regV "scratch") ;
  split_V2 = dirV2 split_V ;
  squeeze_V2 = dirV2 (regV "squeeze") ;
  stab_V2 = dirV2 (regDuplV "stab") ;
  suck_V2 = dirV2 (regV "suck") ;
  throw_V2 = dirV2 throw_V ;
  tie_V2 = dirV2 (regV "tie") ;
  wash_V2 = dirV2 (regV "wash") ;
  wipe_V2 = dirV2 (regV "wipe") ;

--  other_A = regA "other" ;

  grammar_N = regN "grammar" ;
  language_N = regN "language" ;
  rule_N = regN "rule" ;

oper
  aboutP = mkPrep "about" ;
  atP = mkPrep "at" ;
  forP = mkPrep "for" ;
  fromP = mkPrep "from" ;
  inP = mkPrep "in" ;
  onP = mkPrep "on" ;
  toP = mkPrep "to" ;

} ;
