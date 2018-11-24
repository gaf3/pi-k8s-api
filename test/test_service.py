import unittest

import service

class TestService(unittest.TestCase):

    def setUp(self):

        self.api = service.api().app.test_client()

    def test_health(self):

        self.assertEqual(self.api.get("/health").json, {"message": "OK"})

    def test_item_list(self):

        self.assertEqual(self.api.get("/item").json, service.ITEMS)

    def test_item_retrieve(self):

        self.assertEqual(self.api.get("/item/1").json, service.ITEMS[0])

        response = self.api.get("/item/0")
        self.assertEqual(response.status_code, 404)
        self.assertEqual(response.json, {"message": "item 0 not found"})