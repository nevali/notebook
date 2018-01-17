# Session

* Process manager, can be used privileged or unprivileged.
* Sessions are restarted automatically when needed, including on reboot.
* Processes are run under `screen`, so sessions can be attached-to at any time
* Sessions are given names (within the scope of the user) 
* As an unprivileged user, invoking with the '-g' (global) option will trigger re-execution of the command via `sudo`
* At boot-time, there are separate init-scripts for launching global versus user sessions (for different runlevels/checkpoints)
* A user can still use `session` and have their sessions relaunch even without the init-scripts provided they can use `crontab` (and specify `@reboot` as the time)

## Examples

### Automatic naming of sessions

The session name is derived from the initial process name, plus an increment to prevent clashes.

```
$ session create bash
Session 'bash2' started
```

### Creating a suspended session with a particular name

The session will prompt the user to begin execution when they attach to it.

```
$ session create -n backend -s /usr/local/sbin/myserver
Session 'backend' created and suspended.
$ session attach backend
:
```

### Process control

Processes can be suspended and resumed, restarted (killed and re-spawned), stopped (killed), and started (re-spawned).

Upon reboot, a session's state will be preserved: if the session was stopped, then it will not be automatically re-started.

```
$ session suspend backend
$ session resume backend
$ session restart backend
$ session stop backend
$ session start backend
$ session status backend
Session 'backend' is running, PID 46882.
```

### Session attributes

Sessions have properties associated with them, which persist for as long as a session exists.

Note that `session rename` is an alias for `session set [oldname] name [newname]`.

```
$ session set backend start-suspended yes
$ session get backend
name=backend
command=['/usr/local/sbin/myserver']
start-suspended=yes
$ session rename backend mybackend
```

### Deleting a session

```
$ session rm backend
The session 'backend' is running (PID 46882). Use `session rm -f backend` to stop and delete the session.
```
