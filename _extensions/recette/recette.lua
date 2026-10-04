function recette(args, kwargs, meta)

  local title = meta.title
  local author = meta.author
  local description = meta.description
  local image = meta.image
  local categories = meta.categories

  local html = '<div class="recette-entete">'

  -- Image
  if image then
    html = html .. [[
      <div class="recette-image">
        <img src="]] ..
        pandoc.utils.stringify(image) ..
        [[" alt="]] ..
        pandoc.utils.stringify(title) ..
        [[">
      </div>
    ]]
  end

  -- Informations
  html = html .. [[
    <div class="recette-info">
  ]]

  -- Titre
  if title then
    html = html ..
      '<h1>' ..
      pandoc.utils.stringify(title) ..
      '</h1>'
  end

  -- Description
  if description then
    html = html ..
      '<div class="recette-description">' ..
      pandoc.utils.stringify(description) ..
      '</div>'
  end

  -- Catégorie
  if categories then

    html = html ..
      '<div class="recette-categorie">' ..
      '🍰 Catégorie : '

    local cats = {}

    for _, category in ipairs(categories) do
      table.insert(
        cats,
        pandoc.utils.stringify(category)
      )
    end

    html = html ..
      table.concat(cats, ", ") ..
      '</div>'
  end

  -- Auteur
  if author then
    html = html ..
      '<p class="recette-auteur">' ..
      'Par ' ..
      pandoc.utils.stringify(author) ..
      '</p>'
  end

  html = html .. '</div>'
  html = html .. '</div>'

  return pandoc.RawBlock('html', html)
end
