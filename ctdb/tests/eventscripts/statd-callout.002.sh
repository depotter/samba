#!/bin/sh

. "${TEST_SCRIPTS_DIR}/unit.sh"

define_test "2 x add-client, update"

setup_ctdb

FAKE_DATE_OUTPUT="1234565789"

ok_null
simple_test_event "add-client" "192.168.123.45"
simple_test_event "add-client" "192.168.123.46"
simple_test_event "update"

check_ctdb_tdb_statd_state "192.168.123.45" "192.168.123.46"
