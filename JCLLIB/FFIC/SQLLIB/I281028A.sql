SELECT 'DB2P' AS SSID,TCREATOR,TTNAME,GRANTEE,
  ALTERAUTH,DELETEAUTH,INDEXAUTH,INSERTAUTH,SELECTAUTH,UPDATEAUTH,
  REFERENCESAUTH,TRIGGERAUTH
  FROM SYSIBM.SYSTABAUTH
 WHERE GRANTEE IN
('ZZADMCDF'
,'ZZADMHRI'
,'ZZAIMAP'
,'ZZAIMUS'
,'ZZAPMDB'
,'ZZAPMDT'
,'ZZAPMUS'
,'ZZARTAP'
,'ZZBCWDB'
,'ZZBMRAP'
,'ZZCATRD'
,'ZZCBRDB'
,'ZZCDIUS'
,'ZZCEIDB'
,'ZZCEIUS'
,'ZZCIABT'
,'ZZCIADB'
,'ZZCIADT'
,'ZZCIFAP'
,'ZZCIFUS'
,'ZZCISUS'
,'ZZCLIUS'
,'ZZCLRBP'
,'ZZCLRBT'
,'ZZCLRUS'
,'ZZCMSBP'
,'ZZCMSDB'
,'ZZCSAP'
,'ZZCSAT'
,'ZZCWRUS'
,'ZZDB2TEC'
,'ZZEDIABP'
,'ZZEDIAPP'
,'ZZEDIAPT'
,'ZZEDIBP'
,'ZZEDIBT'
,'ZZEISMG'
,'ZZERSBP'
,'ZZERSBT'
,'ZZESTDT'
,'ZZFRGDA'
,'ZZFRGDT'
,'ZZFRIBM'
,'ZZFRPAP'
,'ZZFRPDB'
,'ZZFRPDT'
,'ZZFRPIBM'
,'ZZFRPMG'
,'ZZFRPUS'
,'ZZGLSYS0'
,'ZZHRIAP'
,'ZZHRIDB'
,'ZZHRIUS'
,'ZZIDB2F'
,'ZZINTBP'
,'ZZINTBT'
,'ZZIPSBP'
,'ZZIPSBT'
,'ZZIPSDB'
,'ZZMADBP'
,'ZZMADBT'
,'ZZMAYAP'
,'ZZPAEUG'
,'ZZPBACPT'
,'ZZPBDEMO'
,'ZZPBDEVL'
,'ZZPBDUPD'
,'ZZPBPPRL'
,'ZZPBPROD'
,'ZZPBSUS'
,'ZZPBTEST'
,'ZZPERBP'
,'ZZPMXDC'
,'ZZPRACPT'
,'ZZPRDEMO'
,'ZZPRDEVL'
,'ZZPRDUPD'
,'ZZPRPPRL'
,'ZZPRPROD'
,'ZZPRTEST'
,'ZZPSAUDB'
,'ZZPSDCON'
,'ZZPSDEVL'
,'ZZPSDUPD'
,'ZZPSDVPD'
,'ZZPSPPRL'
,'ZZPSPROD'
,'ZZPSSYS0'
,'ZZPZMUP'
,'ZZQSTBP'
,'ZZQSTBT'
,'ZZQSTUST'
,'ZZRFPDT'
,'ZZRIDUS'
,'ZZSEAAP'
,'ZZSEAMG'
,'ZZSEAUS'
,'ZZSFRBP'
,'ZZSFRBT'
,'ZZSFRDB'
,'ZZSISBT'
,'ZZSRTEST'
,'ZZSURA1'
,'ZZSURDB'
,'ZZSURN1'
,'ZZSUR00'
,'ZZSUR01'
,'ZZSUR02'
,'ZZSUR03'
,'ZZSUR04'
,'ZZSUR05'
,'ZZSUR06'
,'ZZSUR07'
,'ZZSUR08'
,'ZZSUR09'
,'ZZSUR10'
,'ZZSUR11'
,'ZZSUR13'
,'ZZSUR14'
,'ZZSUR15'
,'ZZSUR16'
,'ZZSUR17'
,'ZZSUR18'
,'ZZSUR19'
,'ZZSUR22'
,'ZZSUR24'
,'ZZSUR26'
,'ZZSUR27'
,'ZZTALCG'
,'ZZTHAAG'
,'ZZTUSR1'
,'ZZUBSSP'
,'ZZUCSAP')
