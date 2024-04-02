describe('template spec', () => {
    it('renders the default elements on the screen', () => {
        cy.once('uncaught:exception', () => false);
        cy.visit('http://localhost:5000');

        cy.get(`[id="Value"]`).should('be.visible');
        cy.get(`[id="btnConnectMetamask"]`).should('be.visible');
        cy.get(`[id="btnConnectContract"]`).should('be.visible');
        cy.get(`[id="btnConnectReadValue"]`).should('be.visible');
        cy.get(`[id="btnConnectSerValue"]`).should('be.visible');
    });


    it('connecting to the metamask', () => {
        cy.once('uncaught:exception', () => false);
        cy.visit('http://localhost:5000');
        cy.get(`[id="btnConnectMetamask"]`).click();

    })

    // it('connecting to the contract', () => {

    // })

    // it('read contract value', () => {

    // })

    // it('set contract value', () => {

    // })
})