include("animation.jl")

using Gtk,ImageView
win = GtkWindow("Interaction of bodies",1800,900)
g = GtkGrid()

#combobox
bodies_cb = GtkComboBoxText()
global choices = ["2", "3", "4"]
for choice in choices
  push!(bodies_cb,choice)
end
set_gtk_property!(bodies_cb,:active,2)

# a widget for entering text
global mass_1 = GtkEntry(); set_gtk_property!(mass_1, :text, "0")
global mass_2 = GtkEntry(); set_gtk_property!(mass_2, :text, "0")
global radius_1 = GtkEntry(); set_gtk_property!(radius_1, :text, "0")
global radius_2 = GtkEntry(); set_gtk_property!(radius_2, :text, "0")
global x_1 = GtkEntry(); set_gtk_property!(x_1, :text, "0")
global x_2 = GtkEntry(); set_gtk_property!(x_2, :text, "0")
global y_1 = GtkEntry(); set_gtk_property!(y_1, :text, "0")
global y_2 = GtkEntry(); set_gtk_property!(y_2, :text, "0")
global initial_velocity_x_1 = GtkEntry(); set_gtk_property!(initial_velocity_x_1, :text, "0")
global initial_velocity_x_2 = GtkEntry(); set_gtk_property!(initial_velocity_x_2, :text, "0")
global initial_velocity_y_1 = GtkEntry(); set_gtk_property!(initial_velocity_y_1, :text, "0")
global initial_velocity_y_2 = GtkEntry(); set_gtk_property!(initial_velocity_y_2, :text, "0")
global simulation_time = GtkEntry(); set_gtk_property!(simulation_time, :text, "0")
global delta_t = GtkEntry(); set_gtk_property!(delta_t, :text, "0")
global time_anim = GtkEntry(); set_gtk_property!(time_anim, :text, "0")
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

#buttons
start = GtkButton("Start")
example = GtkButton("Example")
destroyAll = GtkButton("Clear")

#chechbuttons
global v_od_t = GtkCheckButton()
global a_od_t = GtkCheckButton()

#labels
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
global body3_label = GtkLabel("Body 3")
global body4_label = GtkLabel("Body 4")
global delta_t_label = GtkLabel("Δt:")
global time_anim_label = GtkLabel("Animation time:")
global time_sim_label = GtkLabel("Simulation time:")
global v_od_t_label = GtkLabel("v(t):")
global a_od_t_label = GtkLabel("a(t):")
global info_label = GtkLabel("")
global warning_label = GtkLabel("INFORMATIONS!")
global warning_label_1 = GtkLabel(" Please be patient after pressing 'Start' or 'Example'.")
global warning_label_2 = GtkLabel("If you want new animation or plots, please press 'Clear' before 'Start' or 'Example'.")
global warning_label_3 = GtkLabel("If You have any doubts about using the program check the GitHub page, or README.md")

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
g[5,7] = dis_plot_label
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
g[8,5] = example
g[8,6] = destroyAll
g[1,8] = delta_t_label
g[2,8] = delta_t
g[3,8] = time_anim_label
g[4,8] = time_anim
g[1,9] = time_sim_label
g[2,9] = simulation_time
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
g[6,8] = v_od_t
g[8,8] = a_od_t
g[5,8] = v_od_t_label
g[7,8] = a_od_t_label
g[6,11] = info_label
g[9,3] = warning_label
g[9,4] = warning_label_1
g[9,5] = warning_label_2
g[9,6] = warning_label_3

set_gtk_property!(g, :column_spacing, 10)  # introduce a 10-pixel gap between columns
set_gtk_property!(g, :row_spacing, 10) # introduce a 10-pixel gap between rows
push!(win, g)
showall(win)

function AddTime_1_Entry()
    """
    Adding or hiding entries if checkbotton 'v_od_t' was toggled.
    """
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
        g[5,9] = t_1_label
        g[6,9] = t_1_start
        g[6,10] = t_1_stop
    else
        set_gtk_property!(t_1_stop, :visible, false)
        set_gtk_property!(t_1_start, :visible, false)
        set_gtk_property!(t_1_label, :visible, false)
    end
end
function AddTime_2_Entry()
    """
    Adding or hiding entries if checkbotton a_od_t was toggled.
    """
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
        g[8,9] = t_2_start
        g[7,9] = t_2_label
        g[8,10] = t_2_stop
    else
        set_gtk_property!(t_2_start, :visible, false)
        set_gtk_property!(t_2_stop, :visible, false)
        set_gtk_property!(t_2_label, :visible, false)
    end
end
function BodyEntry()
    """
    Adding or hiding entries depending on the option selected in combobox.
    """
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
        set_gtk_property!(mass_3, :text, "0")
        set_gtk_property!(mass_4, :text, "0")
        set_gtk_property!(radius_3, :text, "0")
        set_gtk_property!(radius_4, :text, "0")
        set_gtk_property!(x_3, :text, "0")
        set_gtk_property!(x_4, :text, "0")
        set_gtk_property!(y_3, :text, "0")
        set_gtk_property!(y_4, :text, "0")
        set_gtk_property!(initial_velocity_y_3, :text, "0")
        set_gtk_property!(initial_velocity_y_4, :text, "0")
        set_gtk_property!(initial_velocity_x_3, :text, "0")
        set_gtk_property!(initial_velocity_x_4, :text, "0")
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
        set_gtk_property!(mass_4, :text, "0")
        set_gtk_property!(radius_4, :text, "0")
        set_gtk_property!(x_4, :text, "0")
        set_gtk_property!(y_4, :text, "0")
        set_gtk_property!(initial_velocity_y_4, :text, "0")
        set_gtk_property!(initial_velocity_x_4, :text, "0")
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
function DoEverythink()
    """
    Read the values from entries, change them to 'float',
    call a functions with these values, show animation and plots.
    If some value is wrong function return error dialog with statement.
    """
    try
        global MASS_1 = parse(Float64, get_gtk_property(mass_1, :text,String))
        global MASS_2 = parse(Float64, get_gtk_property(mass_2, :text,String))
        global RADIUS_1 = parse(Float64, get_gtk_property(radius_1, :text,String))
        global RADIUS_2 = parse(Float64, get_gtk_property(radius_2, :text,String))
        global X_1 = parse(Float64, get_gtk_property(x_1, :text,String))
        global X_2 = parse(Float64, get_gtk_property(x_2, :text,String))
        global Y_1 = parse(Float64, get_gtk_property(y_1, :text,String))
        global Y_2 = parse(Float64, get_gtk_property(y_2, :text,String))
        global INITIAL_VELOCITY_X_1 = parse(Float64, get_gtk_property(initial_velocity_x_1, :text,String))
        global INITIAL_VELOCITY_X_2 = parse(Float64, get_gtk_property(initial_velocity_x_2, :text,String))
        global INITIAL_VELOCITY_Y_1 = parse(Float64, get_gtk_property(initial_velocity_y_1, :text,String))
        global INITIAL_VELOCITY_Y_2 = parse(Float64, get_gtk_property(initial_velocity_y_2, :text,String))
        if MASS_1 > 0
            nothing
        else
            return error_dialog(" The mass of body 1 should be greater than 0.")
        end
        if MASS_2 > 0
            nothing
        else
            return error_dialog(" The mass of body 2 should be greater than 0.")
        end
        if RADIUS_1 > 0
            nothing
        else
            return error_dialog(" The radius of body 1 should be greater than 0.")
        end
        if RADIUS_2 > 0
            nothing
        else
            return error_dialog(" The radius of body 2 should be greater than 0.")
        end
        global b1 = [MASS_1;RADIUS_1;X_1;Y_1;INITIAL_VELOCITY_X_1;INITIAL_VELOCITY_Y_1;0;0]
        global b2 = [MASS_2;RADIUS_2;X_2;Y_2;INITIAL_VELOCITY_X_2;INITIAL_VELOCITY_Y_2;0;0]
        global bodies = [b1 b2]
        if get_gtk_property(mass_4,:visible,Bool) == true
            global MASS_4 = parse(Float64, get_gtk_property(mass_4, :text,String))
            global RADIUS_4 = parse(Float64, get_gtk_property(radius_4, :text,String))
            global X_4 = parse(Float64, get_gtk_property(x_4, :text,String))
            global Y_4 = parse(Float64, get_gtk_property(y_4, :text,String))
            global INITIAL_VELOCITY_X_4 = parse(Float64, get_gtk_property(initial_velocity_x_4, :text,String))
            global INITIAL_VELOCITY_Y_4 = parse(Float64, get_gtk_property(initial_velocity_y_4, :text,String))
            global MASS_3 = parse(Float64, get_gtk_property(mass_3, :text,String))
            global RADIUS_3 = parse(Float64, get_gtk_property(radius_3, :text,String))
            global X_3 = parse(Float64, get_gtk_property(x_3, :text,String))
            global Y_3 = parse(Float64, get_gtk_property(y_3, :text,String))
            global INITIAL_VELOCITY_X_3 = parse(Float64, get_gtk_property(initial_velocity_x_3, :text,String))
            global INITIAL_VELOCITY_Y_3 = parse(Float64, get_gtk_property(initial_velocity_y_3, :text,String))
            if MASS_3 > 0
                nothing
            else
                return error_dialog(" The mass of body 3 should be greater than 0.")
            end
            if MASS_4 > 0
                nothing
            else
                return error_dialog(" The mass of body 4 should be greater than 0.")
            end
            if RADIUS_3 > 0
                nothing
            else
                return error_dialog(" The radius of body 3 should be greater than 0.")
            end
            if RADIUS_4 > 0
                nothing
            else
                return error_dialog(" The radius of body 4 should be greater than 0.")
            end
            global b3 = [MASS_3;RADIUS_3;X_3;Y_3;INITIAL_VELOCITY_X_3;INITIAL_VELOCITY_Y_3;0;0]
            global b4 = [MASS_4;RADIUS_4;X_4;Y_4;INITIAL_VELOCITY_X_4;INITIAL_VELOCITY_Y_4;0;0]
            global bodies = [b1 b2 b3 b4]
        end
        if (get_gtk_property(mass_4,:visible,Bool) == false) & (get_gtk_property(mass_3,:visible,Bool) == true)
            global MASS_3 = parse(Float64, get_gtk_property(mass_3, :text,String))
            global RADIUS_3 = parse(Float64, get_gtk_property(radius_3, :text,String))
            global X_3 = parse(Float64, get_gtk_property(x_3, :text,String))
            global Y_3 = parse(Float64, get_gtk_property(y_3, :text,String))
            global INITIAL_VELOCITY_X_3 = parse(Float64, get_gtk_property(initial_velocity_x_3, :text,String))
            global INITIAL_VELOCITY_Y_3 = parse(Float64, get_gtk_property(initial_velocity_y_3, :text,String))
            if MASS_3 > 0
                nothing
            else
                return error_dialog(" The mass of body 3 should be greater than 0.")
            end
            if RADIUS_3 > 0
                nothing
            else
                return error_dialog(" The radius of body 3 should be greater than 0.")
            end
            global b3 = [MASS_3;RADIUS_3;X_3;Y_3;INITIAL_VELOCITY_X_3;INITIAL_VELOCITY_Y_3;0;0]
            global bodies = [b1 b2 b3]
        end
        global DELTA_T = parse(Float64, get_gtk_property(delta_t, :text,String))
        global TIME_ANIM = parse(Float64, get_gtk_property(time_anim, :text,String))
        global TIME_SIM = parse(Float64, get_gtk_property(simulation_time, :text,String))
        if TIME_ANIM > 0
            nothing
        else
            return error_dialog("Animation time should be greater than 0.")
        end
        if TIME_SIM > 0
            nothing
        else
             return error_dialog("Simulation time should be greater than 0.")
        end
        if get_gtk_property(v_od_t, :active,Bool) == true
            global T_1_START = parse(Float64, get_gtk_property(t_1_start, :text,String))
            global T_1_STOP = parse(Float64, get_gtk_property(t_1_stop, :text,String))
            if 0 <= T_1_START < T_1_STOP <= TIME_SIM
                nothing
            else
                return error_dialog("t for plot v(t) is wrong!")
            end
        end
        if get_gtk_property(a_od_t, :active,Bool) == true
            global T_2_START = parse(Float64, get_gtk_property(t_2_start, :text,String))
            global T_2_STOP = parse(Float64, get_gtk_property(t_2_stop, :text,String))
            if 0 <= T_2_START < T_2_STOP <= TIME_SIM
                nothing
            else
                return error_dialog("t for plot a(t) is wrong!")
            end
        end
    catch
        return error_dialog("Error!!! \nIncorerect data. Check the inputs!\n(Look for commas and characters)")
    end
    global data = run(bodies,TIME_SIM,DELTA_T)
    simulate(data,TIME_ANIM)
    if get_gtk_property(a_od_t, :active,Bool) == true
        graph(data,TIME_SIM,"a",[T_2_START,T_2_STOP])
    end
    if get_gtk_property(v_od_t, :active,Bool) == true
        graph(data,TIME_SIM,"v",[T_1_START,T_1_STOP])
    end
    global plot_v_od_t_label = GtkLabel("v(t)")
    g[4:6,12] = plot_v_od_t_label
    set_gtk_property!(plot_v_od_t_label, :visible, true)
    global plot_a_od_t_label = GtkLabel("a(t)")
    g[7:9,12] = plot_a_od_t_label
    set_gtk_property!(plot_a_od_t_label, :visible, true)
    global animacja_label = GtkLabel("Animation")
    g[1:3,12] = animacja_label
    set_gtk_property!(animacja_label, :visible, true)
    #wykres
    show_animation()
    if get_gtk_property(v_od_t, :active,Bool) == true
        show_v_od_t()
    end
    if get_gtk_property(a_od_t, :active,Bool) == true
        show_a_od_t()
    end
end
function showExample()
    """
    Show exemplary use of program.
    """
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
    set_gtk_property!(mass_1, :text, "1.5")
    set_gtk_property!(mass_2, :text, "100000000000")
    set_gtk_property!(radius_1, :text, "4")
    set_gtk_property!(radius_2, :text, "8")
    set_gtk_property!(x_1, :text, "5")
    set_gtk_property!(x_2, :text, "5")
    set_gtk_property!(y_1, :text, "0")
    set_gtk_property!(y_2, :text, "5")
    set_gtk_property!(initial_velocity_x_1, :text, "0.5")
    set_gtk_property!(initial_velocity_x_2, :text, "0")
    set_gtk_property!(initial_velocity_y_1, :text, "0")
    set_gtk_property!(initial_velocity_y_2, :text, "0")
    set_gtk_property!(simulation_time, :text, "40")
    set_gtk_property!(delta_t, :text, "0.1")
    set_gtk_property!(time_anim, :text, "10")
    set_gtk_property!(mass_3, :text, "0")
    set_gtk_property!(mass_4, :text, "0")
    set_gtk_property!(radius_3, :text, "0")
    set_gtk_property!(radius_4, :text, "0")
    set_gtk_property!(x_3, :text, "0")
    set_gtk_property!(x_4, :text, "0")
    set_gtk_property!(y_3, :text, "0")
    set_gtk_property!(y_4, :text, "0")
    set_gtk_property!(initial_velocity_y_3, :text, "0")
    set_gtk_property!(initial_velocity_y_4, :text, "0")
    set_gtk_property!(initial_velocity_x_3, :text, "0")
    set_gtk_property!(initial_velocity_x_4, :text, "0")
    b = [1.5; 4.0; 5.0; 0.0; 0.5; 0.0; 0.0; 0.0]
    c = [100000000000.0; 8.0; 5.0; 5.0; 0.0; 0.0; 0.0; 0.0]
    bodies = [b c]
    Δt = 0.1
    t = 40.0
    r = run(bodies, t, Δt)
    graph(r, t,"a",[0,40])
    graph(r, t,"v",[0,40])
    simulate(r, 10.0)
    set_gtk_property!(info_label, :label, "Plots v(t) and a(t) for t start 0 and t stop 40")
    global plot_v_od_t_label = GtkLabel("v(t)")
    g[4:6,12] = plot_v_od_t_label
    set_gtk_property!(plot_v_od_t_label, :visible, true)
    global plot_a_od_t_label = GtkLabel("a(t)")
    g[7:9,12] = plot_a_od_t_label
    set_gtk_property!(plot_a_od_t_label, :visible, true)
    global animacja_label = GtkLabel("Animation")
    g[1:3,12] = animacja_label
    set_gtk_property!(animacja_label, :visible, true)
    show_animation()
    show_v_od_t()
    show_a_od_t()
end
function destroy_all()
    """
    Destroy the displayed plots and animation.
    If it was used after displaying the example, deletes information about sample plots.
    """
    destroy(anima)
    destroy(plot_v_od_t)
    destroy(plot_a_od_t)
    set_gtk_property!(info_label, :label, "")
end
function show_animation()
    """
    Show animation.
    """
    global anima = GtkImage("animation.gif")
    g[1:3,13] = anima
    set_gtk_property!(anima, :visible, true)
end
function show_v_od_t()
    """
    Show plot v(t).
    """
    global plot_v_od_t = GtkImage("v.png")
    g[4:6,13] = plot_v_od_t
    set_gtk_property!(plot_v_od_t, :visible, true)
end
function show_a_od_t()
    """
    Show plot a(t).
    """
    global plot_a_od_t = GtkImage("a.png")
    g[7:9,13] = plot_a_od_t
    set_gtk_property!(plot_a_od_t, :visible, true)
end
#signals
signal_connect(x -> AddTime_1_Entry(), v_od_t, "toggled")
signal_connect(x -> AddTime_2_Entry(), a_od_t, "toggled")
signal_connect(x->BodyEntry(),bodies_cb, "changed")
signal_connect(x -> DoEverythink(), start, "clicked")
signal_connect(x -> showExample(), example, "clicked")
signal_connect(x -> destroy_all(), destroyAll, "clicked")
