gen::add_generator "Python 2.x" gen_py::generate
gen::add_generator "Python 3.x" gen_py::generate3

namespace eval gen_py {

variable g_callbacks

# Autogenerated with DRAKON Editor 1.14

proc assign { variable value } {
    #item 572
    return "$variable = $value"
}

proc bad_case { switch_var } {
    #item 573
    return "raise Exception\(\"Not expected:  \" + str\($switch_var\)\)"
}

proc block_close { output depth } {
    
}

proc commentator { line } {
    #item 45
    return "#$line"
}

proc compare { variable constant } {
    #item 581
    return "$variable == $constant"
}

proc else_start { } {
    #item 582
    return "else:"
}

proc elseif_start { } {
    #item 583
    return "elif "
}

proc extract_signature { text name } {
    set lines [ gen::separate_from_comments $text ]
    
    set _next_item_ 152
    while { 1 } {
        if {$_next_item_ == 152} {
            if {[ llength $lines ] == 0} {
                #item 404
                return [ list {} \
                    [ gen::create_signature procedure public {} "" ] ]
            } else {
                #item 151
                set first_line [ lindex $lines 0 ]
                set first [ lindex $first_line 0 ]
                set _next_item_ 1560001
            }
    
        } elseif {$_next_item_ == 1560001} {
            if {$first == "#method"} {
                #item 168
                set type method
                set start 1
                set _next_item_ 175
            } else {
                set _next_item_ 1560002
            }
    
        } elseif {$_next_item_ == 1560002} {
            if {$first == "#comment"} {
                #item 171
                return [ list {} \
                    [ gen::create_signature "comment" {} {} {} ]]
            } else {
                #item 169
                set type procedure
                set start 0
                set _next_item_ 175
            }
    
        } elseif {$_next_item_ == 175} {
            set parameters {}
            set count [ llength $lines ]
            #item 1780001
            set i $start
            set _next_item_ 1780002
    
        } elseif {$_next_item_ == 1780002} {
            if {$i < $count} {
                #item 177
                set current [ lindex $lines $i ]
                lappend parameters $current
                #item 1780003
                incr i
                set _next_item_ 1780002
            } else {
                #item 179
                return [ list {} \
                    [ gen::create_signature $type public $parameters "" ] ]
            }
    
        }
    }
}

proc foreach_check { item_id first second } {
    #item 26
    set go_var "_go$item_id"
    
    return $go_var
}

proc foreach_current { item_id first second } {
    #item 38
    return ""
}

proc foreach_declare { item_id first second } {
    #item 664
    return ""
}

proc foreach_incr { item_id first second } {
    #item 32
    set iter_var "_it$item_id"
    set go_var "_go$item_id"
    
    set lines [ list \
    "try:" \
    "    $first = $iter_var.next\(\)" \
    "    $go_var = True" \
    "except StopIteration:" \
    "    $go_var = False" ]
    
    return [ join $lines "\n" ]
}

proc foreach_incr3 { item_id first second } {
    #item 387
    set iter_var "_it$item_id"
    set go_var "_go$item_id"
    
    set lines [ list \
    "try:" \
    "    $first = next\($iter_var\)" \
    "    $go_var = True" \
    "except StopIteration:" \
    "    $go_var = False" ]
    
    return [ join $lines "\n" ]
}

proc foreach_init { item_id first second } {
    #item 19
    set iter_var "_it$item_id"
    set go_var "_go$item_id"
    
    set lines [ list \
    "$iter_var = iter\($second\)" \
    "try:" \
    "    $first = $iter_var.next\(\)" \
    "    $go_var = True" \
    "except StopIteration:" \
    "    $go_var = False" ]
    
    return [ join $lines "\n" ]
}

proc foreach_init3 { item_id first second } {
    #item 381
    set iter_var "_it$item_id"
    set go_var "_go$item_id"
    
    set lines [ list \
    "$iter_var = iter\($second\)" \
    "try:" \
    "    $first = next\($iter_var\)" \
    "    $go_var = True" \
    "except StopIteration:" \
    "    $go_var = False" ]
    
    return [ join $lines "\n" ]
}

proc generate { db gdb filename } {
    #item 388
    p.generate $db $gdb $filename 2
}

proc generate3 { db gdb filename } {
    #item 394
    p.generate $db $gdb $filename 3
}

proc generate_body { gdb diagram_id start_item node_list items incoming } {
    #item 590
    variable g_callbacks
    #item 591
    return [ cbody::generate_body $gdb $diagram_id $start_item $node_list \
    $items $incoming $g_callbacks ]
}

proc if_end { } {
    #item 584
    return ":"
}

proc if_start { } {
    #item 585
    return "if "
}

proc make_callbacks { version } {
    #item 641
    set callbacks {}
    
    gen::put_callback callbacks assign			gen_py::assign
    gen::put_callback callbacks compare			gen_py::compare
    gen::put_callback callbacks compare2		gen_py::compare
    gen::put_callback callbacks while_start 	gen_py::while_start
    gen::put_callback callbacks if_start		gen_py::if_start
    gen::put_callback callbacks elseif_start	gen_py::elseif_start
    gen::put_callback callbacks if_end			gen_py::if_end
    gen::put_callback callbacks else_start		gen_py::else_start
    gen::put_callback callbacks pass			gen_py::pass
    gen::put_callback callbacks continue		gen_py::p.continue
    gen::put_callback callbacks return_none		gen_py::return_none
    gen::put_callback callbacks block_close		gen_py::block_close
    gen::put_callback callbacks comment			gen_py::commentator
    gen::put_callback callbacks bad_case		gen_py::bad_case	
    gen::put_callback callbacks for_check		gen_py::foreach_check
    gen::put_callback callbacks for_current		gen_py::foreach_current	
    gen::put_callback callbacks body			gen_py::generate_body
    gen::put_callback callbacks signature		gen_py::extract_signature
    gen::put_callback callbacks and				gen_py::p.and
    gen::put_callback callbacks or				gen_py::p.or
    gen::put_callback callbacks not				gen_py::p.not
    gen::put_callback callbacks break			"break"
    gen::put_callback callbacks declare		gen_py::p.declare
    gen::put_callback callbacks for_declare gen_py::foreach_declare
    #item 6420001
    if {$version == 2} {
        #item 648
        gen::put_callback callbacks for_init		gen_py::foreach_init
        gen::put_callback callbacks for_incr		gen_py::foreach_incr
    } else {
        #item 6420002
        if {$version == 3} {
            
        } else {
            #item 6420003
            error "Unexpected switch value: $version"
        }
        #item 649
        gen::put_callback callbacks for_init		gen_py::foreach_init3
        gen::put_callback callbacks for_incr		gen_py::foreach_incr3
    }
    #item 650
    return $callbacks
}

proc p.and { left right } {
    #item 621
    return "($left) and ($right)"
}

proc p.build_declaration { name signature } {
    #item 103
    unpack $signature type access parameters returns
    set param_names {}
    #item 1050001
    set _col105 $parameters
    set _len105 [ llength $_col105 ]
    set _ind105 0
    while { 1 } {
        #item 1050002
        if {$_ind105 < $_len105} {
            #item 1050004
            set parameter [ lindex $_col105 $_ind105 ]
            #item 104
            set pname [ lindex $parameter 0 ]
            lappend param_names $pname
            #item 1050003
            incr _ind105
        } else {
            break
        }
    }
    #item 107
    set param_string [ join $param_names ", " ]
    return "def $name\($param_string\):"
}

proc p.continue { } {
    #item 586
    return "continue"
}

proc p.declare { type name value } {
    #item 656
    return ""
}

proc p.generate { db gdb filename pversion } {
    #item 651
    variable g_callbacks
    #item 337
    set g_callbacks [ make_callbacks $pversion ]
    #item 349
    gen::fix_graph $gdb $g_callbacks 0
    unpack [ gen::scan_file_description $db { header footer class } ] header footer class
    set functions [ gen::generate_functions $db $gdb $g_callbacks 1 ]
    #item 338
    if {[ graph::errors_occured ]} {
        
    } else {
        #item 358
        set procedures {}
        set methods {}
        #item 3600001
        set _col360 $functions
        set _len360 [ llength $_col360 ]
        set _ind360 0
        while { 1 } {
            #item 3600002
            if {$_ind360 < $_len360} {
                #item 3600004
                set function [ lindex $_col360 $_ind360 ]
                #item 362
                set signature [ lindex $function 2 ]
                set type [ lindex $signature 0 ]
                #item 5920001
                if {$type == "procedure"} {
                    #item 363
                    lappend procedures $function
                    #item 3600003
                    incr _ind360
                } else {
                    #item 5920002
                    if {$type == "comment"} {
                        #item 3600003
                        incr _ind360
                    } else {
                        #item 5920003
                        if {$type == "method"} {
                            
                        } else {
                            #item 5920004
                            error "Unexpected switch value: $type"
                        }
                        #item 365
                        if {$class == ""} {
                            #item 368
                            set name [ lindex $function 1 ]
                            set lines [ list "The file does not have a class. " \
                            "Nowhere to put method '$name'." ]
                            error [ join $lines "" ]
                            break
                        } else {
                            #item 364
                            lappend methods $function
                            #item 3600003
                            incr _ind360
                        }
                    }
                }
            } else {
                #item 339
                set hfile [ replace_extension $filename "py" ]
                set fhandle [ open $hfile w ]
                catch {
                	p.print_to_file $fhandle $procedures \
                                     $class $methods  $header $footer
                } error_message
                
                catch { close $fhandle }
                #item 340
                if {$error_message == ""} {
                    break
                } else {
                    #item 341
                    error $error_message
                    break
                }
            }
        }
    }
}

proc p.not { operand } {
    #item 633
    return "not ($operand)"
}

proc p.or { left right } {
    #item 652
    return "($left) or ($right)"
}

proc p.print_proc { fhandle procedure depth } {
    #item 97
    unpack $procedure diagram_id name signature body
    #item 66
    set declaration [ p.build_declaration $name $signature ]
    set indent [ gen::make_indent $depth ]
    #item 67
    set body_depth [ expr { $depth + 1 } ]
    set lines [ gen::indent $body $body_depth ]
    #item 598
    if {$lines == ""} {
        #item 600
        set lines "$indent    pass"
    } else {
        
    }
    #item 96
    puts $fhandle ""
    puts $fhandle "$indent$declaration"
    puts $fhandle $lines
    puts $fhandle ""
}

proc p.print_to_file { fhandle procs class methods header footer } {
    #item 401
    if {$header == ""} {
        
    } else {
        #item 68
        puts $fhandle $header
    }
    #item 400
    set version [ version_string ]
    puts $fhandle \
        "# Autogenerated with DRAKON Editor $version"
    #item 710001
    set _col71 $procs
    set _len71 [ llength $_col71 ]
    set _ind71 0
    while { 1 } {
        #item 710002
        if {$_ind71 < $_len71} {
            #item 710004
            set procedure [ lindex $_col71 $_ind71 ]
            #item 72
            p.print_proc $fhandle $procedure 0
            #item 710003
            incr _ind71
        } else {
            break
        }
    }
    #item 69
    if {$class == ""} {
        
    } else {
        #item 77
        puts $fhandle $class
        #item 80
        if {[ llength $methods ] == 0} {
            #item 615
            if {[ line_count $class ] < 2} {
                #item 81
                puts $fhandle "    pass"
            } else {
                
            }
        } else {
            #item 740001
            set _col74 $methods
            set _len74 [ llength $_col74 ]
            set _ind74 0
            while { 1 } {
                #item 740002
                if {$_ind74 < $_len74} {
                    #item 740004
                    set procedure [ lindex $_col74 $_ind74 ]
                    #item 75
                    p.print_proc $fhandle $procedure 1
                    #item 740003
                    incr _ind74
                } else {
                    break
                }
            }
        }
    }
    #item 76
    puts $fhandle $footer
}

proc pass { } {
    #item 587
    return "pass"
}

proc return_none { } {
    #item 588
    return "return None"
}

proc while_start { } {
    #item 589
    return "while True:"
}

}
