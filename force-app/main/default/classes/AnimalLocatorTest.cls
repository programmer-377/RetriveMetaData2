@isTest
private class AnimalLocatorTest {
    @isTest
    static void testPostCalloutUsingHttpCalloutMockInterface() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(1);
        String actual2 = AnimalLocator.getAnimalNameById(null);
        String expected = 'bear';
        String expected2 = null;
        System.assertEquals(actual, expected);
        System.assertEquals(actual2, expected2);
    }
}