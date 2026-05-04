using GLMakie
using LinearAlgebra

# ================= PARÂMETROS DE CONFIGURAÇÃO =================
const TAMANHO_RASTRO = 75 
const OFFSET_ROTULO = 2.0  # Aumentei um pouco para separar mais do planeta
# ==============================================================

# 1. Configuração da Figura e Eixo
fig = Figure(size = (1000, 700), backgroundcolor = :black)
ax = Axis3(fig[1,1], aspect = :data, title = "Sistema Solar", titlecolor = :white)
limits!(ax, -40, 40, -40, 40, -5, 8) 

hidedecorations!(ax) 
hidespines!(ax)

# 2. Inclui as meshes
# Certifique-se de que o arquivo "CorposCelestiais.jl" está na mesma pasta
include("CorposCelestiais.jl")

# ================= FUNÇÕES AUXILIARES =================

function inicializar_rastro!(ax, cor)
    pontos_obs = Observable(Point3f[Point3f(100,100,100)]) 
    lines!(ax, pontos_obs, color = (cor, 0.6), linewidth = 1.5)
    return pontos_obs
end

function inicializar_rotulo!(ax, nome)
    pos_obs = Observable(Point3f(0, 0, 0)) 
    # CORREÇÃO AQUI: 'textsize' virou 'fontsize'
    text!(ax, pos_obs, text = nome, color = :white, 
          align = (:center, :bottom), fontsize = 10, justification = :center)
    return pos_obs
end

# ================= INICIALIZAÇÃO =================

# --- Mercúrio ---
traj_merc = inicializar_rastro!(ax, :gray70)
lbl_merc_pos = inicializar_rotulo!(ax, "Mercúrio")

# --- Vênus ---
traj_venus = inicializar_rastro!(ax, :gold1)
lbl_venus_pos = inicializar_rotulo!(ax, "Vênus")

# --- Terra ---
traj_terra = inicializar_rastro!(ax, :dodgerblue)
lbl_terra_pos = inicializar_rotulo!(ax, "Terra")

# --- Marte ---
traj_marte = inicializar_rastro!(ax, :orangered)
lbl_marte_pos = inicializar_rotulo!(ax, "Marte")

# --- Júpiter ---
traj_jup = inicializar_rastro!(ax, :tan)
lbl_jup_pos = inicializar_rotulo!(ax, "Júpiter")

# --- Saturno ---
traj_sat = inicializar_rastro!(ax, :goldenrod3)
lbl_sat_pos = inicializar_rotulo!(ax, "Saturno")

# --- Urano ---
traj_urano = inicializar_rastro!(ax, :cyan3)
lbl_urano_pos = inicializar_rotulo!(ax, "Urano")

# --- Netuno ---
traj_net = inicializar_rastro!(ax, :blue)
lbl_net_pos = inicializar_rotulo!(ax, "Netuno")


# ================= LOOP DE ANIMAÇÃO =================

t = Observable(0.0)

on(t) do angle
    # Função interna para atualizar tudo de uma vez
    function atualizar_corpo!(mesh_obj, traj_obs, label_pos_obs, r, w, ang, orbita)
        # 1. Nova Posição
        x_new = r * cos(ang * w)
        y_new = r * sin(ang * w)
        z_new = 0.0
        
        # 2. Move planeta
        translate!(mesh_obj, x_new, y_new, z_new)

        # 3. Atualiza Rastro
        lista_atual = traj_obs[]
        push!(lista_atual, Point3f(x_new, y_new, z_new))
        if length(lista_atual) > orbita
            popfirst!(lista_atual)
        end
        notify(traj_obs) 

        # 4. Atualiza Rótulo
        label_pos_obs[] = Point3f(x_new, y_new, z_new + OFFSET_ROTULO)
    end

    # Chamadas de atualização
    atualizar_corpo!(Mercurio, traj_merc, lbl_merc_pos, 3.0, 4.0, angle, 40)
    atualizar_corpo!(Venus, traj_venus, lbl_venus_pos, 4.5, 2.8, angle, 60)
    atualizar_corpo!(Terra, traj_terra, lbl_terra_pos, 7.0, 1.8, angle, 85)
    atualizar_corpo!(Marte, traj_marte, lbl_marte_pos, 9.5, 1.2, angle, 140)
    atualizar_corpo!(Jupiter, traj_jup, lbl_jup_pos, 16.0, 0.5, angle, 300)
    atualizar_corpo!(Saturno, traj_sat, lbl_sat_pos, 22.0, 0.3, angle, 500)
    atualizar_corpo!(Urano, traj_urano, lbl_urano_pos, 28.0, 0.15, angle, 1000)
    atualizar_corpo!(Netuno, traj_net, lbl_net_pos, 34.0, 0.08, angle, 1800)
end

display(fig)

# Loop infinito (enquanto a janela estiver aberta)
@async while isopen(fig.scene)
    t[] += 0.02
    sleep(1/60)
end


# Gravação (Opcional)
"""
# 1. Pré-aquecimento (opcional: faz os rastros já aparecerem no início do vídeo)
println("Calculando órbitas iniciais...")
for i in 1:10000
    t[] += 0.02
end

# 2. Gravação
output_file = "sistema_solar.mp4" # 5 Alterar para gif se quiser
fps = 60
total_frames = 540 # 9 segundos de vídeo a 30fps

println("Iniciando gravação de $output_file...")
record(fig, output_file, 1:total_frames; framerate = fps) do i
    t[] += 0.02


end
println("Concluído!")
"""