# CorposCelestiais.jl (Apenas a parte da definição dos mesh!)

# 1 - Sol (Aumentamos o Sol para ele servir como âncora visual)
Sol = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 2.5), 
    color = :yellow
)

# Planetas Rochosos (Raio menor e similar)
# 2 - Mercúrio
Mercurio = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 0.25), 
    color = :gray
)

# 3 - Vênus
Venus = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 0.35), 
    color = :orange
)

# 4 - Terra
Terra = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 0.4), # Usando 0.4 como referência de tamanho
    color = :blue
)

# 5 - Marte
Marte = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 0.3), 
    color = :red
)

# Planetas Gigantes (Raio muito maior)
# 6 - Júpiter (O maior de todos)
Jupiter = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 1.0), 
    color = :brown
)

# 7 - Saturno (Grande, mas menor que Júpiter)
Saturno = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 0.9), 
    color = :gold
)

# 8 - Urano
Urano = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 0.6), 
    color = :cyan
)

# 9 - Netuno
Netuno = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 0.6), 
    color = :blue
)