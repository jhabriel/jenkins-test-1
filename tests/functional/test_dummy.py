import porepy as pp
import pytest
import numpy as np


class TestDummy:
    """Create some dummy test"""

    def test_check_simple_sum(self):
        """Tests a simple sum"""
        assert 1 + 1 == 2

    def test_check_fail_test(self):
        """Make a failing test on purpose"""
        assert 1 == 2