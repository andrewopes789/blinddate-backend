@potentials.each do |potential|
  json.set! potential.id do
    json.partial! 'potential', potential: potential
  end
end
