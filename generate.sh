#!/bin/bash
osm_extract luxembourg.pbf luxembourg_{first_out,head,geo_distance,travel_time,latitude,longitude}
compute_contraction_hierarchy luxembourg_{first_out,head,travel_time,travel_time_ch}
compute_contraction_hierarchy luxembourg_{first_out,head,geo_distance,geo_distance_ch}
compute_nested_dissection_order luxembourg_{first_out,head,latitude,longitude,cch_order}
N=$[(`stat --printf="%s" luxembourg_first_out`-1)/4]
generate_random_node_list $N 100000 0 luxembourg_source_node
generate_random_node_list $N 100000 1 luxembourg_target_node
run_contraction_hierarchy_query luxembourg_{travel_time_ch,source_node,target_node,query_reference_travel_time_length}
run_contraction_hierarchy_query luxembourg_{geo_distance_ch,source_node,target_node,query_reference_geo_distance_length}
