module UiConstants

  # Report Controller constants
  GRAPH_MAX_COUNT = 10

  VALID_PLANNING_VM_MODES = PlanningHelper::PLANNING_VM_MODES.keys.index_by(&:to_s)

  ALL_TIMEZONES = ActiveSupport::TimeZone.all.collect { |tz| ["(GMT#{tz.formatted_offset}) #{tz.name}", tz.name] }
  # Following line does not include timezones with partial hour offsets
  # ALL_TIMEZONES = ActiveSupport::TimeZone.all.collect{|tz| tz.utc_offset % 3600 == 0 ? ["(GMT#{tz.formatted_offset}) #{tz.name}",tz.name] : nil}.compact

  CATEGORY_CHOICES = {}
  CATEGORY_CHOICES["services"] = N_("Services")
  CATEGORY_CHOICES["software"] = N_("Software")
  CATEGORY_CHOICES["system"] = N_("System")
  CATEGORY_CHOICES["accounts"] = N_("User Accounts")
  CATEGORY_CHOICES["vmconfig"] = N_("VM Configuration")
  # CATEGORY_CHOICES["vmevents"] = "VM Events"

  # Assignment choices
  ASSIGN_TOS = {}

  # This set of assignments was created for miq_alerts
  ASSIGN_TOS["ExtManagementSystem"] = {
    "enterprise"                 => N_("The Enterprise"),
    "ext_management_system"      => N_("Selected Providers"),
    "ext_management_system-tags" => N_("Tagged Providers")
  }
  ASSIGN_TOS["EmsCluster"] = {
    "ems_cluster"      => N_("Selected Cluster / Deployment Roles"),
    "ems_cluster-tags" => N_("Tagged Cluster / Deployment Roles"),
  }.merge(ASSIGN_TOS["ExtManagementSystem"])
  ASSIGN_TOS["Host"] = {
    "host"      => N_("Selected Host / Nodes"),
    "host-tags" => N_("Tagged Host / Nodes")
  }.merge(ASSIGN_TOS["EmsCluster"])
  ASSIGN_TOS["Vm"] = {
    "ems_folder"         => N_("Selected Folders"),
    "resource_pool"      => N_("Selected Resource Pools"),
    "resource_pool-tags" => N_("Tagged Resource Pools"),
    "vm-tags"            => N_("Tagged VMs and Instances")
  }.merge(ASSIGN_TOS["Host"])
  ASSIGN_TOS["Storage"] = {
    "enterprise"   => N_("The Enterprise"),
    "storage"      => N_("Selected Datastores"),
    "storage-tags" => N_("Tagged Datastores"),
    "tenant"       => N_("Tenants")
  }
  ASSIGN_TOS["MiqServer"] = {
    "miq_server" => N_("Selected Servers"),
  }
  ASSIGN_TOS["MiddlewareServer"] = {
    "enterprise"        => N_("The Enterprise"),
    "middleware_server" => N_("Selected Middleware Servers")
  }
  ASSIGN_TOS["ContainerNode"] = {
    "enterprise" => N_("The Enterprise"),
  }


  # This set of assignments was created for chargeback_rates
  ASSIGN_TOS[:chargeback_storage] = ASSIGN_TOS["Storage"]
  ASSIGN_TOS[:chargeback_compute] = {
    "enterprise"             => N_("The Enterprise"),
    "ext_management_system"  => N_("Selected Providers"),
    "ems_cluster"            => N_("Selected Cluster / Deployment Roles"),
    "ems_container"          => N_("Selected Containers Providers"),
    "vm-tags"                => N_("Tagged VMs and Instances"),
    "container_image-tags"   => N_("Tagged Container Images"),
    "container_image-labels" => N_("Labeled Container Images"),
    "tenant"                 => N_("Tenants")
  }

  EXP_COUNT_TYPE = [N_("Count of"), "count"].freeze  # Selection for count based filters
  EXP_FIND_TYPE = [N_("Find"), "find"].freeze        # Selection for find/check filters
  EXP_TYPES = [                           # All normal filters
    [N_("Field"), "field"],
    EXP_COUNT_TYPE,
    [N_("Tag"), "tag"],
    EXP_FIND_TYPE
  ]
  VM_EXP_TYPES = [                        # Special VM registry filter
    [N_("Registry"), "regkey"]
  ]

  # Snapshot ages for delete_snapshots_by_age action type
  SNAPSHOT_AGES = {}
  (1..23).each { |a| SNAPSHOT_AGES[a.hours.to_i] = (a.to_s + (a < 2 ? _(" Hour") : _(" Hours"))) }
  (1..6).each { |a| SNAPSHOT_AGES[a.days.to_i] = (a.to_s + (a < 2 ? _(" Day") : _(" Days"))) }
  (1..4).each { |a| SNAPSHOT_AGES[a.weeks.to_i] = (a.to_s + (a < 2 ? _(" Week") : _(" Weeks"))) }

  # Expression constants
  EXP_TODAY = "Today"
  EXP_FROM = "FROM"
  EXP_IS = "IS"

  # Need this for mapping with MiqWidget record content_type field
  WIDGET_CONTENT_TYPE = {
    "r"  => "report",
    "c"  => "chart",
    "rf" => "rss",
    "m"  => "menu"
  }

  VALID_PERF_PARENTS = {
    "EmsCluster" => :ems_cluster,
    "Host"       => :host
  }

  MIQ_AE_COPY_ACTIONS = %w(miq_ae_class_copy miq_ae_instance_copy miq_ae_method_copy)

end

# Make these constants globally available
include UiConstants
