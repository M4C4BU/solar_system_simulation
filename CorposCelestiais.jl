# 1 - Sol
Sol = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 2.5), 
    color = :yellow
)

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

# 6 - Júpiter
Jupiter = mesh!(
    ax,
    Sphere(Point3f(0, 0, 0), 1.0), 
    color = :brown
)

# 7 - Saturno
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