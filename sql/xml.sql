select dbms_xmlgen.getxml('SELECT /*+ ORDERED USE_NL(n,a,t) */
         n.node_id,
         n.node_key,
         n.node_path,
         MAX(DECODE(t.attribute_key,'OS_Name',
             REPLACE(a.attribute_string,
                     'Windows_',''))) os,
         MAX(DECODE(t.attribute_key,'OS_Release',
             REPLACE(a.attribute_string,
                     ' Service Pack ',' sp'))) rel,
         MAX(DECODE(t.attribute_key,'OS_Version',
             DECODE(SUBSTR(a.attribute_string,1,7),
               'Red Hat', 'RedHat'||SUBSTR(a.attribute_string,
                                    INSTR(a.attribute_string,'release')+7,
                                    INSTR(a.attribute_string,'(')
                                      -INSTR(a.attribute_string,'release')-8),
                          REPLACE(SUBSTR(a.attribute_string,
                                  INSTR(a.attribute_string,'-',-1)+1),
                                  'Build ','')))) ver,
         MAX(DECODE(t.attribute_key,'Host_Info',
             REPLACE(a.attribute_string,
                    'AlphaServer ',''))) info,
         MAX(DECODE(t.attribute_key,'CPUs',
             DECODE(a.attribute_number,
                    NULL,'  ',1,'  ',a.attribute_number||'x')))||
         MAX(DECODE(t.attribute_key,'CPU_MHz',a.attribute_number))    cpus,
         MAX(DECODE(t.attribute_key,'Memory',a.attribute_number))     ram,
         MAX(DECODE(t.attribute_key,'Disk_Space',a.attribute_number)) gb,
         MAX(DECODE(t.attribute_key,'TimeZone',a.attribute_string))   tz,
         DECODE(GREATEST(SYSDATE-1,MAX(DECODE(t.attribute_key,'Backup_Status',a.last_date))),
                SYSDATE-1, 'OLD'||LTRIM(TO_CHAR(SYSDATE-MAX(DECODE(t.attribute_key,'Backup_Status',a.last_date)),'0')),
                           MAX(DECODE(t.attribute_key,'Backup_Status',                         a.attribute_string))) bkup,
         MAX(DECODE(t.attribute_key,'CPUs',a.attribute_number))    num_cpus,
         MAX(DECODE(t.attribute_key,'Cores',a.attribute_number))    cores
   FROM  node           n,
         attribute      a,
         attribute_type t
   WHERE n.node_type_id          = (SELECT node_type_id
                                     FROM  node_type
                                     WHERE node_type_key = 'Server')
     AND n.end_date             IS NULL
     AND a.node_id           (+) = n.node_id
     AND a.end_date             IS NULL
     AND t.attribute_type_id (+) = a.attribute_type_id
     AND n.node_path like '%/MetService%'
   GROUP BY n.node_id, n.node_key, n.node_path') from dual;
exit
