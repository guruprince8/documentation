- Connect to Pega Internal Cassandra 
cqlsh 192.168.1.5 9042 -u dnode_ext -p dnode_ext
-- descibe key spaces
describe keyspaces;

vbd            system_auth  states              adm
data           system       system_distributed  adm_commitlog
system_schema  aggregation  system_traces

-- describe adm 
 describe adm

CREATE KEYSPACE adm WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': '3'}  AND durable_writes = true;

CREATE TABLE adm.adm_scoringmodel (
    fk text PRIMARY KEY,
    format text,
    mdl text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

CREATE TABLE adm.adm_factory_handled_responses (
    fk text PRIMARY KEY,
    rcount bigint,
    rtime timeuuid,
    tpdata text,
    tpformat text
) WITH bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';
    
-- describe vbd keyspace
describe vbd;
CREATE KEYSPACE vbd WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': '3'}  AND durable_writes = true;

-- describe data
 describe data;

CREATE KEYSPACE data WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': '3'}  AND durable_writes = true;

CREATE TABLE data.pxdecisionresults_pega_decisionengine_ab5de04587 (
    pxsubjectid text,
    pxinteractionid text,
    ds_ text,
    data_ text,
    PRIMARY KEY (pxsubjectid, pxinteractionid, ds_)
) WITH CLUSTERING ORDER BY (pxinteractionid ASC, ds_ ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

CREATE TABLE data.es_1291363649_adaptive_cst (
    pxcustomerid text,
    pxcapturetime timestamp,
    pxeventid text,
    pxdescription text,
    pxeventtype text,
    pxgroupid text,
    PRIMARY KEY (pxcustomerid, pxcapturetime, pxeventid)
) WITH CLUSTERING ORDER BY (pxcapturetime DESC, pxeventid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';
    
-- describe aggregation
describe aggregation;

CREATE KEYSPACE aggregation WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': '3'}  AND durable_writes = true;

CREATE TABLE aggregation."stores_Data_pxStrategyResult_pyIHSummary" (
    pt text,
    nm blob,
    k blob,
    ky blob,
    k2 blob,
    vl blob,
    PRIMARY KEY ((pt, nm, k), ky, k2)
) WITH CLUSTERING ORDER BY (ky ASC, k2 ASC)
    AND bloom_filter_fp_chance = 0.1
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.LeveledCompactionStrategy'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

CREATE TABLE aggregation.ih_customer_partitioned_v2 (
    pt text,
    sid text,
    st text,
    ot timestamp,
    PRIMARY KEY (pt, sid, st)
) WITH CLUSTERING ORDER BY (sid ASC, st ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

CREATE TABLE aggregation.ih_customer_v2 (
    sid text,
    st text,
    ot timestamp,
    PRIMARY KEY (sid, st)
) WITH CLUSTERING ORDER BY (st ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';

-- robot manager
https://community.pega.com/marketplace/components/pega-robot-manager
https://docs.pega.com/pega-robot-manager/871/pega-robot-manager

-- these are the cache tables in pega 
truncate table pr_sys_appcache_entry;
truncate table pr_sys_appcache_dep;
truncate table pr_sys_appcache_shortcut;
truncate table pr_assembledclasses;
truncate table pr_sys_rule_impl;
truncate table pr4_rule_sysgen;

truncate table pr_sys_appcache_entry;
truncate table pr_sys_appcache_dep;
truncate table pr_sys_appcache_shortcut;
truncate table pr_assembledclasses;
truncate table pr_sys_rule_impl;
truncate table pr4_rule_sysgen;

PR4_RULE_SYSGEN - PR4_RULE_SYSGEN_IA0004555 backup table
PR_ASSEMBLEDCLASSES - PR_ASSEMBLEDCLASSES_IA0004555 backup table
PR_SYS_APPCACHE_DEP - PR_SYS_APPCACHE_DEP_IA0004555 backup table
PR_SYS_APPCACHE_ENTRY - PR_SYS_APEN_IA0004555 backup table
PR_SYS_APPCACHE_SHORTCUT - PR_SYS_APSH_IA0004555 backup table
PR_SYS_RULE_IMPL - PR_SYS_RULE_IMPL_IA0004555 backup table
