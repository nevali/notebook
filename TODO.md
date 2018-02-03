# To-do list

## 2018-02-05

- [ ] Meter readings
- [ ] [libawsclient#1](https://github.com/bbcarchdev/libawsclient/issues/1) ([DATALAB-113](https://jira.dev.bbc.co.uk/browse/DATALAB-113), [RESDATA-1220](https://jira.dev.bbc.co.uk/browse/RESDATA-1220))
- [ ] [liburi#5](https://github.com/bbcarchdev/liburi/issues/5)
- [ ] Data hosting (ADOPS-whatever)
- [ ] Update RES service templates to add all the `USERS` keys
- [ ] Fix `whereami`
  - [ ] iCalendar parsing (on `ptah`)!
  - [ ] UTF-8!
    * is that a PHP-side issue?
- [ ] Fix blog
  - [ ] get WIP up ASAP to un-break URLs and other TLAs
- [ ] Block out some training days (GDPR, mandatory training refresh, GCP)
- [ ] Contact HR (bank details)
- [ ] Dig out ERB-template-application script
  * can it be usefully integrated into [bbcarchdev-base](https://github.com/bbcarchdev/bbcarchdev-base)?
- [ ] Reply to all of [@nickshanks](https://github.com/nickshanks)’s e-mails!
- [ ] Revisit libcluster monitoring endpoints
  * ensure both eng teams know about them!
  * should libcluster (optionally?) gather system stats so that instrumentation can be used for scaling?
    * is there a decent permissive OSS library for reading load averages and so on?
	* what does [istatd](https://github.com/tiwilliam/istatd) do?
- [x] Commit picoc-based Flow interpreter WIP repo
  - [ ] Tidy up sources, add build machinery, Travis config
  - [ ] Implement scoped identifiers
