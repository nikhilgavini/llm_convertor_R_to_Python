library(tibble)

df <- tibble::tribble(
  ~player,   ~team, ~week, ~attempts, ~passing_yards, ~pass_td, ~rush_td,
  "Stafford","LAR",   9,      27,          240,          2,        0,
  "Stafford","LAR",  10,      34,          310,          3,        0,
  "Stafford","LAR",  11,      31,          198,          1,        0,
  "Young",   "CAR",   9,      29,          179,          1,        0,
  "Young",   "CAR",  10,      33,          205,          1,        0,
  "Young",   "CAR",  11,      28,           NA,          0,        0,
  "Allen",   "BUF",  10,      38,          287,          2,        1,
  "Allen",   "BUF",  11,      35,          312,          3,        1
)

teams <- tibble::tribble(
  ~team, ~division,
  "LAR", "NFC West",
  "CAR", "NFC South",
  "BUF", "AFC East"
)
