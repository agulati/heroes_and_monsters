class Quest

  def self.all
    [
      {
        quest: "nemean_lion",
        name: "Hercules",
        labor: "Kill the Nemean Lion",
        type: "hero"
      },
      {
        quest: "stymphalian_birds",
        name: "Achilles",
        labor: "Kill the Stymphalian Birds",
        type: "hero"
      },
      {
        quest: "cretan_bull",
        name: "Perseus",
        labor: "Capture the Cretan Bull",
        type: "hero"
      },
      {
        quest: "erymanthian_boar",
        name: "Minotaur",
        labor: "Capture the Erymanthian Boar",
        type: "monster"
      },
      {
        quest: "lernean_hydra",
        name: "Medusa",
        labor: "Kill the Lernean Hydra",
        type: "monster"
      },
      {
        quest: "cattle_of_geryon",
        name: "Kraken",
        labor: "Capture the Cattle of Geryon",
        type: "monster"
      },
    ]
  end
end
