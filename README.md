# Sistema Solar 3D (Julia)

Um sistema solar 3D feito em **Julia** com **GLMakie**: os 8 planetas orbitam o Sol em velocidades relativas, deixando rastros das órbitas, com renderização em tempo real.

A ideia foi explorar até onde uma biblioteca normalmente associada à visualização de dados consegue chegar, indo além dos gráficos de linha, barras e heatmaps.

> Primeiro projeto de uma série em que exploro o lado menos óbvio de cada linguagem: **Julia** (este aqui), **Python** (paleta de cores com K-Means) e **R** (flow field com ggplot2).

## Como funciona

- **Cena 3D:** o GLMakie desenha o Sol e os 8 planetas num espaço tridimensional.
- **Órbitas:** cada planeta se move em torno do Sol com uma velocidade relativa própria.
- **Rastros:** o caminho percorrido por cada planeta fica desenhado, o que mostra a forma da órbita.
- **Animação e interatividade:** feitas com **Observables**, que atualizam a cena em tempo real conforme os valores mudam.

## Requisitos

- Julia 1.6 ou superior
- Placa de vídeo e drivers com suporte a OpenGL (o GLMakie renderiza na GPU)
- Pacote:

```julia
using Pkg
Pkg.add("GLMakie")
```

## O que dá pra mexer

- **Velocidades das órbitas:** mudar as velocidades relativas muda o ritmo da animação.
- **Tamanho e cor dos planetas:** ajuda a destacar cada um.
- **Tamanho dos rastros:** rastros longos mostram a órbita inteira, curtos deixam a cena mais limpa.
