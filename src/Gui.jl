using Gtk,ImageView
win = GtkWindow("Interaction of bodies",1850,1000)
g = GtkGrid()


bodies_cb = GtkComboBoxText()
global choices = ["2", "3", "4"]
for choice in choices
  push!(bodies_cb,choice)
end
set_gtk_property!(bodies_cb,:active,2)
#pola do wpisywania
# a widget for entering text
mass_1 = GtkEntry(); set_gtk_property!(mass_1, :text, "0")
mass_2 = GtkEntry(); set_gtk_property!(mass_2, :text, "0")
radius_1 = GtkEntry(); set_gtk_property!(radius_1, :text, "0")
radius_2 = GtkEntry(); set_gtk_property!(radius_2, :text, "0")
x_1 = GtkEntry(); set_gtk_property!(x_1, :text, "0")
x_2 = GtkEntry(); set_gtk_property!(x_2, :text, "0")
y_1 = GtkEntry(); set_gtk_property!(y_1, :text, "0")
y_2 = GtkEntry(); set_gtk_property!(y_2, :text, "0")
initial_velocity_x_1 = GtkEntry(); set_gtk_property!(initial_velocity_x_1, :text, "0")
initial_velocity_x_2 = GtkEntry(); set_gtk_property!(initial_velocity_x_2, :text, "0")
initial_velocity_y_1 = GtkEntry(); set_gtk_property!(initial_velocity_y_1, :text, "0")
initial_velocity_y_2 = GtkEntry(); set_gtk_property!(initial_velocity_y_2, :text, "0")
simulation_time = GtkEntry(); set_gtk_property!(simulation_time, :text, "0")

global delta_t = GtkEntry(); set_gtk_property!(delta_t, :text, "0")
global time_anim = GtkEntry(); set_gtk_property!(time_anim, :text, "0")
global x_min = GtkEntry(); set_gtk_property!(x_min, :text, "0")
global x_max = GtkEntry(); set_gtk_property!(x_max, :text, "0")
global y_min = GtkEntry(); set_gtk_property!(y_min, :text, "0")
global y_max = GtkEntry(); set_gtk_property!(y_max, :text, "0")

global mass_3 = GtkEntry();set_gtk_property!(mass_3, :text, "0")
global mass_4 = GtkEntry(); set_gtk_property!(mass_4, :text, "0")
global radius_3 = GtkEntry(); set_gtk_property!(radius_3, :text, "0")
global radius_4 = GtkEntry(); set_gtk_property!(radius_4, :text, "0")
global x_3 = GtkEntry(); set_gtk_property!(x_3, :text, "0")
global x_4 = GtkEntry(); set_gtk_property!(x_4, :text, "0")
global y_3 = GtkEntry(); set_gtk_property!(y_3, :text, "0")
global y_4 = GtkEntry(); set_gtk_property!(y_4, :text, "0")
global initial_velocity_y_3 = GtkEntry(); set_gtk_property!(initial_velocity_y_3, :text, "0")
global initial_velocity_y_4 = GtkEntry(); set_gtk_property!(initial_velocity_y_4, :text, "0")
global initial_velocity_x_3 = GtkEntry(); set_gtk_property!(initial_velocity_x_3, :text, "0")
global initial_velocity_x_4 = GtkEntry(); set_gtk_property!(initial_velocity_x_4, :text, "0")
global body3_label = GtkLabel("Body 3")
global body4_label = GtkLabel("Body 4")




#przyciski
start = GtkButton("Start")

#chechbutton
global v_od_t = GtkCheckButton()
global a_od_t = GtkCheckButton()
collision = GtkCheckButton()


#teksty
no_of_bodies_label = GtkLabel("Number of bodies:")
body1_label = GtkLabel("Body 1")
body2_label = GtkLabel("Body 2")
mass_label = GtkLabel("Mass:")
radius_label = GtkLabel("Radius:")
position_label = GtkLabel("Position:")
x_label = GtkLabel("X:")
y_label = GtkLabel("Y:")
initial_velocity_y_label = GtkLabel("Initial velocity y:")
initial_velocity_x_label = GtkLabel("Initial velocity x:")
dis_anim_label = GtkLabel("DISPLAY ANIMATION:")
dis_plot_label = GtkLabel("DISPLAY PLOT:")
simulation_label = GtkLabel("SIMULATION:")
collision_label = GtkLabel("Collision:")


global delta_t_label = GtkLabel("Δt:")
global x_min_label = GtkLabel("x min")
global x_max_label = GtkLabel("x max")
global y_min_label = GtkLabel("y min")
global y_max_label = GtkLabel("y max")
global time_anim_label = GtkLabel("Animation time:")
global time_sim_label = GtkLabel("Simulation time:")
global v_od_t_label = GtkLabel("v(t):")
global a_od_t_label = GtkLabel("a(t):")



# Now let's place these graphical elements into the Grid:
# Cartesian coordinates, g[x,y]
g[1,1] = no_of_bodies_label
g[2,2] = mass_label
g[3,2] = radius_label
g[4:5,1] = position_label
g[4,2] = x_label
g[5,2] = y_label
g[6,2] = initial_velocity_x_label
g[7,2] = initial_velocity_y_label
g[1,7] = simulation_label
g[3,7] = dis_anim_label

g[7,7] = dis_plot_label
g[2,1] = bodies_cb
g[1,3] = body1_label
g[2,3] = mass_1
g[3,3] = radius_1
g[4,3] = x_1
g[5,3] = y_1
g[6,3] = initial_velocity_x_1
g[7,3] = initial_velocity_y_1


g[1,4] = body2_label
g[2,4] = mass_2
g[3,4] = radius_2
g[4,4] = x_2
g[5,4] = y_2
g[6,4] = initial_velocity_x_2
g[7,4] = initial_velocity_y_2
g[8,4] = start

g[1,8] = delta_t_label
g[2,8] = delta_t
g[3,10] = time_anim_label
g[4,10] = time_anim
g[1,9] = time_sim_label
g[1,10] = collision_label
g[2,9] = simulation_time
g[2,10] = collision
g[3,8] = x_min_label
g[3,9] = y_min_label
g[4,8] = x_min
g[4,9] = y_min
g[5,8] = x_max_label
g[5,9] = y_max_label
g[6,8] = x_max
g[6,9] = y_max


g[1,5] = body3_label
g[2,5] = mass_3
g[3,5] = radius_3
g[4,5] = x_3
g[5,5] = y_3
g[6,5] = initial_velocity_x_3
g[7,5] = initial_velocity_y_3
g[1,6] = body4_label
g[2,6] = mass_4
g[3,6] = radius_4
g[4,6] = x_4
g[5,6] = y_4
g[6,6] = initial_velocity_x_4
g[7,6] = initial_velocity_y_4


g[8,8] = v_od_t
g[10,8] = a_od_t
g[7,8] = v_od_t_label
g[9,8] = a_od_t_label


set_gtk_property!(g, :column_spacing, 10)  # introduce a 10-pixel gap between columns
set_gtk_property!(g, :row_spacing, 10)
push!(win, g)
showall(win)

#wartości

function Dodawanie_2()
    global value_v_od_t = get_gtk_property(v_od_t, :active,Bool)

    if value_v_od_t == true
        global t_1_label = GtkLabel("t:")

        global t_1_start = GtkEntry()
        global t_1_stop= GtkEntry()
        set_gtk_property!(t_1_start, :visible, true)
        set_gtk_property!(t_1_stop, :visible, true)
        set_gtk_property!(t_1_start, :text, "start")
        set_gtk_property!(t_1_stop, :text, "stop")
        set_gtk_property!(t_1_label, :visible, true)
        g[7,9] = t_1_label
        g[8,9] = t_1_start
        g[8,10] = t_1_stop

    else
        set_gtk_property!(t_1_stop, :visible, false)
        set_gtk_property!(t_1_start, :visible, false)
        set_gtk_property!(t_1_label, :visible, false)

    end
end
function Dodawanie_3()
    global value_a_od_t=get_gtk_property(a_od_t, :active,Bool)
    if value_a_od_t == true
        global t_2_label = GtkLabel("t:")
        global t_2_start = GtkEntry()
        global t_2_stop= GtkEntry()
        set_gtk_property!(t_2_start, :visible, true)
        set_gtk_property!(t_2_stop, :visible, true)
        set_gtk_property!(t_2_start, :text, "start")
        set_gtk_property!(t_2_stop, :text, "stop")
        set_gtk_property!(t_2_label, :visible, true)

        g[10,9] = t_2_start
        g[9,9] = t_2_label
        g[10,10] = t_2_stop
    else
        set_gtk_property!(t_2_start, :visible, false)
        set_gtk_property!(t_2_stop, :visible, false)
        set_gtk_property!(t_2_label, :visible, false)

    end
end


signal_connect(x -> Dodawanie_2(), v_od_t, "toggled")
signal_connect(x -> Dodawanie_3(), a_od_t, "toggled")

function PolaCial()
     # get the active index
    global idx = get_gtk_property(bodies_cb, "active", Int)
    if choices[idx+1] == "2"
        set_gtk_property!(body3_label, :visible, false)
        set_gtk_property!(body4_label, :visible, false)
        set_gtk_property!(mass_3, :visible, false)
        set_gtk_property!(radius_3, :visible, false)
        set_gtk_property!(x_3, :visible, false)
        set_gtk_property!(y_3, :visible, false)
        set_gtk_property!(initial_velocity_y_3, :visible, false)
        set_gtk_property!(initial_velocity_x_3, :visible, false)
        set_gtk_property!(mass_4, :visible, false)
        set_gtk_property!(radius_4, :visible, false)
        set_gtk_property!(x_4, :visible, false)
        set_gtk_property!(y_4, :visible, false)
        set_gtk_property!(initial_velocity_y_4, :visible, false)
        set_gtk_property!(initial_velocity_x_4, :visible, false)
    elseif choices[idx+1] == "3"
        set_gtk_property!(body3_label, :visible, true)
        set_gtk_property!(body4_label, :visible, false)
        set_gtk_property!(mass_3, :visible, true)
        set_gtk_property!(radius_3, :visible, true)
        set_gtk_property!(x_3, :visible, true)
        set_gtk_property!(y_3, :visible, true)
        set_gtk_property!(initial_velocity_y_3, :visible, true)
        set_gtk_property!(initial_velocity_x_3, :visible, true)
        set_gtk_property!(mass_4, :visible, false)
        set_gtk_property!(radius_4, :visible, false)
        set_gtk_property!(x_4, :visible, false)
        set_gtk_property!(y_4, :visible, false)
        set_gtk_property!(initial_velocity_x_4, :visible, false)
        set_gtk_property!(initial_velocity_y_4, :visible, false)
    elseif choices[idx+1] == "4"
        set_gtk_property!(body3_label, :visible, true)
        set_gtk_property!(body4_label, :visible, true)
        set_gtk_property!(mass_3, :visible, true)
        set_gtk_property!(radius_3, :visible, true)
        set_gtk_property!(x_3, :visible, true)
        set_gtk_property!(y_3, :visible, true)
        set_gtk_property!(initial_velocity_x_3, :visible, true)
        set_gtk_property!(initial_velocity_y_3, :visible, true)
        set_gtk_property!(mass_4, :visible, true)
        set_gtk_property!(radius_4, :visible, true)
        set_gtk_property!(x_4, :visible, true)
        set_gtk_property!(y_4, :visible, true)
        set_gtk_property!(initial_velocity_x_4, :visible, true)
        set_gtk_property!(initial_velocity_y_4, :visible, true)

    end
end
signal_connect(x->PolaCial(),bodies_cb, "changed")

function calarea()
    try
        MASS_1 = parse(Float64, get_gtk_property(mass_1, :text,String))
        MASS_2 = parse(Float64, get_gtk_property(mass_2, :text,String))
        RADIUS_1 = parse(Float64, get_gtk_property(radius_1, :text,String))
        RADIUS_2 = parse(Float64, get_gtk_property(radius_2, :text,String))
        X_1 = parse(Float64, get_gtk_property(x_1, :text,String))
        X_2 = parse(Float64, get_gtk_property(x_2, :text,String))
        Y_1 = parse(Float64, get_gtk_property(y_1, :text,String))
        Y_2 = parse(Float64, get_gtk_property(y_2, :text,String))
        INITIAL_VELOCITY_X_1 = parse(Float64, get_gtk_property(initial_velocity_x_1, :text,String))
        INITIAL_VELOCITY_X_2 = parse(Float64, get_gtk_property(initial_velocity_x_2, :text,String))
        INITIAL_VELOCITY_Y_1 = parse(Float64, get_gtk_property(initial_velocity_y_1, :text,String))
        INITIAL_VELOCITY_Y_2 = parse(Float64, get_gtk_property(initial_velocity_y_2, :text,String))
        if MASS_1 > 0
            nothing
        else
            error_dialog(" The mass of body 1 should be greater than 0.")
        end
        if MASS_2 > 0
            nothing
        else
            error_dialog(" The mass of body 2 should be greater than 0.")
        end
        if RADIUS_1 > 0
            nothing
        else
            error_dialog(" The radius of body 1 should be greater than 0.")
        end
        if RADIUS_2 > 0
            nothing
        else
            error_dialog(" The radius of body 2 should be greater than 0.")
        end
        if get_gtk_property(mass_4,:visible,Bool) == true
            MASS_4 = parse(Float64, get_gtk_property(mass_4, :text,String))
            RADIUS_4 = parse(Float64, get_gtk_property(radius_4, :text,String))
            X_4 = parse(Float64, get_gtk_property(x_4, :text,String))
            Y_4 = parse(Float64, get_gtk_property(y_4, :text,String))
            INITIAL_VELOCITY_X_4 = parse(Float64, get_gtk_property(initial_velocity_x_4, :text,String))
            INITIAL_VELOCITY_Y_4 = parse(Float64, get_gtk_property(initial_velocity_y_4, :text,String))
            MASS_3 = parse(Float64, get_gtk_property(mass_3, :text,String))
            RADIUS_3 = parse(Float64, get_gtk_property(radius_3, :text,String))
            X_3 = parse(Float64, get_gtk_property(x_3, :text,String))
            Y_3 = parse(Float64, get_gtk_property(y_3, :text,String))
            INITIAL_VELOCITY_X_3 = parse(Float64, get_gtk_property(initial_velocity_x_3, :text,String))
            INITIAL_VELOCITY_Y_3 = parse(Float64, get_gtk_property(initial_velocity_y_3, :text,String))
            if MASS_3 > 0
                nothing
            else
                error_dialog(" The mass of body 3 should be greater than 0.")
            end
            if MASS_4 > 0
                nothing
            else
                error_dialog(" The mass of body 4 should be greater than 0.")
            end
            if RADIUS_3 > 0
                nothing
            else
                error_dialog(" The radius of body 3 should be greater than 0.")
            end
            if RADIUS_4 > 0
                nothing
            else
                error_dialog(" The radius of body 4 should be greater than 0.")
            end
        end
        if get_gtk_property(mass_4,:visible,Bool) == false & get_gtk_property(mass_3,:visible,Bool) == true
            MASS_3 = parse(Float64, get_gtk_property(mass_3, :text,String))
            RADIUS_3 = parse(Float64, get_gtk_property(radius_3, :text,String))
            X_3 = parse(Float64, get_gtk_property(x_3, :text,String))
            Y_3 = parse(Float64, get_gtk_property(y_3, :text,String))
            INITIAL_VELOCITY_X_3 = parse(Float64, get_gtk_property(initial_velocity_x_3, :text,String))
            INITIAL_VELOCITY_Y_3 = parse(Float64, get_gtk_property(initial_velocity_y_3, :text,String))
            if MASS_3 > 0
                nothing
            else
                error_dialog(" The mass of body 3 should be greater than 0.")
            end
            if RADIUS_3 > 0
                nothing
            else
                error_dialog(" The radius of body 3 should be greater than 0.")
            end
        end
        DELTA_T = parse(Float64, get_gtk_property(delta_t, :text,String))
        TIME_ANIM = parse(Float64, get_gtk_property(time_anim, :text,String))
        TIME_SIM = parse(Float64, get_gtk_property(simulation_time, :text,String))
        X_MIN = parse(Float64, get_gtk_property(x_min, :text,String))
        X_MAX = parse(Float64, get_gtk_property(x_max, :text,String))
        Y_MIN = parse(Float64, get_gtk_property(y_min, :text,String))
        Y_MAX = parse(Float64, get_gtk_property(y_max, :text,String))
        if X_MIN < X_MAX
            nothing
        else
            error_dialog("x min should be smaller than x max.")
        end
        if Y_MIN < Y_MAX
            nothing
        else
            error_dialog("y min should be smaller than y max.")
        end
        if TIME_ANIM > 0
            nothing
        else
            error_dialog("Animation time should be greater than 0.")
        end
        if TIME_SIM > 0
            nothing
        else
            error_dialog("Simulation time should be greater than 0.")
        end
        if get_gtk_property(v_od_t, :active,Bool) == true
            T_1_START = parse(Float64, get_gtk_property(t_1_start, :text,String))
            T_1_STOP = parse(Float64, get_gtk_property(t_1_stop, :text,String))
            if 0 <= T_1_START < T_1_STOP <= TIME_ANIM
                nothing
            else
                error_dialog("t for plot v(t) is wrong!")
            end
        end
        if get_gtk_property(a_od_t, :active,Bool) == true
            T_2_START = parse(Float64, get_gtk_property(t_2_start, :text,String))
            T_2_STOP = parse(Float64, get_gtk_property(t_2_stop, :text,String))
            if 0 <= T_2_START < T_2_STOP <= TIME_ANIM
                nothing
            else
                error_dialog("t for plot a(t) is wrong!")
            end
        end
    catch
        error_dialog("Error!!! \nIncorerect data.")
    end
    global plot_v_od_t_label = GtkLabel("v(t)")
    g[4:6,11] = plot_v_od_t_label
    set_gtk_property!(plot_v_od_t_label, :visible, true)
    global plot_a_od_t_label = GtkLabel("a(t)")
    g[7:9,11] = plot_a_od_t_label
    set_gtk_property!(plot_a_od_t_label, :visible, true)
    global animacja_label = GtkLabel("Animacja")
    g[1:3,11] = animacja_label
    set_gtk_property!(animacja_label, :visible, true)
    LIMITS=[X_MIN,X_MAX,Y_MIN,Y_MAX]

end
signal_connect(x -> calarea(), start, "clicked")
